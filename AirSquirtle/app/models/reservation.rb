class Reservation < ApplicationRecord

  enum status: {Waiting: 0, Approved: 1, Declined: 2}

  belongs_to :user
  belongs_to :room

  private
  
    def create_notification #notify the host when a new request for booking is made
      type = self.room.Instant? ? "New Booking" : "New Request"
      guest = User.find(self.user_id)
      
      Notification.create(content: "#{type} from #{guest.fullname}", user_id: self.room.user_id)
    end
end
