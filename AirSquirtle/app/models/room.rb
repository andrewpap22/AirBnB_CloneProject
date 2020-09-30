class Room < ApplicationRecord
  enum instant: {Request: 0, Instant: 1}

  belongs_to :user
  has_many :photos #creting relationship of rooms table with photos table, as we did with rooms and users
  has_many :reservations

  has_many :guest_reviews
  has_many :calendars

  #we need to tell geocode which fields we want to address
  geocoded_by :address
  after_validation :geocode, if: :address_changed? #whenever we change the address, geocode will validate if its valid address and then it will regenerate latitude and lognitude for that address in gmaps

  #setting up room model, and made a relationship between room model and user model
  validates :home_type, presence: true
  validates :room_type, presence: true
  validates :accommodate, presence: true
  validates :bed_room, presence: true
  validates :bath_room, presence: true

  def cover_photo(size)
    if self.photos.length > 0
      self.photos[0].image.url(size) #if this room has a photo uploaded, we display that photo (if more than 1 display the 1st)
    else
      "A_blank_flag.png" #else display a default photo from app/assets/images
    end
  end

  def average_rating
    guest_reviews.count == 0 ? 0 : guest_reviews.average(:star).round(2).to_i
  end
end
