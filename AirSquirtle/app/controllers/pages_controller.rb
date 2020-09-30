# class PagesController < ApplicationController
#   def home
#       @rooms = Room.where(active: true).limit(3) #from all the rooms of the specific logged in host
#                                                  # just show 3 of them
#   end

#   def search
#     #step 1
#     if (params[:search].present? && params[:search].strip != "")
#       session[:loc_search] = params[:search] #remember the location that people search for
#     end

#     #step 2
#     if (session[:loc_search] && session[:loc_search] != "") #if we have a value for the location
#       @rooms_address = Room.where(active: true).near(session[:loc_search], 5, order: 'distance') #get all the rooms nearby the specific location within range of 5kms
#     else
#       @rooms_address = Room.where(active: true).all #return all the rooms that're active in the db
#     end

#     #step 3
#     @search = @rooms_address.ransack(params[:q]) #get all the rooms with the conditions selected by the user in the search page (example the price_gteq from, the search.html.erb)
#     @rooms = @search.result

#     @arrRooms = @rooms.to_a #transform the above result to an array and use it below...

#     #step 4 
#     #if the user seaches with a date range we should loop within every single room and check if there is
#     #a reservation within that particular time period and if there is at least one room
#     #then it means that the room is not avialable and we need to remove that room from the array of the rooms
#     if (params[:start_date] && params[:end_date] && !params[:start_date].empty? && !params[:end_date].empty?)
#       start_date = Date.parse(params[:start_date]) #get the values of start and end date form frontend page
#       end_date = Date.parse(params[:end_date])

#       @rooms.each do |room|
#         not_available = room.reservations.where( #if there is a conflict of search date and reservation date
#           "(? <= start_date AND start_date <= ?)
#           OR (? <= end_date AND end_date <= ?)
#           OR (start_date < ? AND ? < end_date)",
#           start_date, end_date,
#           start_date, end_date,
#           start_date, end_date
#         ).limit(1)

#         not_available_in_calendar = room.calendars.where(
#           "status = ? AND ? <= day AND day <+ ?",
#           1, start_date, end_date
#           ).limit(1)

#           if not_available.length > 0 || not_available_in_calendar.length > 0
#           @arrRooms.delete(room) #delete the room with the conflict dates
#         end
#         #and after all these, the last step is to display the result of the above calculations
#         #i.e. the arrRooms in the front end using rails templating for communication with the backend (ruby)
#         #at the file: search.html.erb (inside directory app/assets/pages/)
#       end
#     end
#   end
# end



class PagesController < ApplicationController
  def home
    @rooms = Room.where(active: true).limit(3)
  end
  
  def search
    # Did the user provide location
    if params[:search].present? && params[:search].strip != ""
      session[:loc_search] = params[:search]
    end
    
    # If we have value for location we get nearby rooms
    if session[:loc_search] && session[:loc_search] != ""
      @rooms_address = Room.where(active: true).near(session[:loc_search], 5, order: 'distance')
    else
      @rooms_adress = Room.where(active: true).all
    end
    
    # Use ransack to apply all the filters that user selected to rooms found
    @search = @rooms_address.ransack(params[:q])
    @rooms = @search.result
    
    @arrRooms = @rooms.to_a
    
    
    # If user search date range and we check if the room is avaliable
    if (params[:start_date] && params[:end_date] && !params[:start_date].empty? && !params[:end_date].empty?)
    
      start_date = Date.parse(params[:start_date])
      end_date = Date.parse(params[:end_date])
      
      @rooms.each do |room|
        not_available = room.reservations.where(
          "((? <= start_date AND start_date <= ?)
          OR (? <= end_date AND end_date <= ?)
          OR (start_date < ? AND ? < end_date))
          AND status = ?",
          start_date, end_date,
          start_date, end_date,
          start_date, end_date,
          1
        ).limit(1)
        
        not_available_in_calendar = room.calendars.where(
          "status = ? AND ? <= day AND day <+ ?",
          1, start_date, end_date
          ).limit(1)
        
        if not_available.length > 0 || not_available_in_calendar.length > 0
          @arrRooms.delete(room)
        end
      end
    end
  end
  
end