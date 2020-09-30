class PhotosController < ApplicationController 

  def create
    @room = Room.find(params[:room_id])
    if params[:images]
      params[:images].each do |img|
        @room.photos.create(image: img)
      end

      @photos = @room.photos
      redirect_back(fallback_location: request.referer, notice: "Photo saved successfully...")
    end
  end

  def destroy
    @photo = Photo.find(params[:id]) #to get a photo based on id from db
    @room = @photo.room #get the room of that photo
    #if we add the @ before the room we can use that variable inside views/destroy.js
    #otherwise we ca only use it inside this file

    @photo.destroy
    @photos = Photo.where(room_id: @room.id) #get the remaining photos of the room

    respond_to :js #refer to destroy.js.erb
  end
    
  end