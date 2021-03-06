class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :omniauthable

  validates :fullname, presence: true, length: {maximum: 50} # fullname must be always presented and max 50 charslong 

  has_many :rooms #host can have 1 or more rooms to rent out
  has_many :reservations

  has_many :guest_reviews, class_name: "GuestReview", foreign_key: "guest_id"
  has_many :host_reviews, class_name: "HostReview", foreign_key: "host_id"

  has_many :notifications #relationship of notifications with the user

  has_one :setting
  after_create :add_setting

  def admin?
    has_role?(:admin)
  end

  def add_setting
    Setting.create(user: self, enable_sms: true, enable_email: true)  
  end

  def self.from_omniauth(auth)
    user = User.where(email: auth.info.email).first
 
    if user
      return user
    else
       where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
         user.email = auth.info.email
         user.password = Devise.friendly_token[0,20]
         user.fullname = auth.info.name
         user.image = auth.info.image
         user.uid = auth.uid
         user.provider = auth.provider
 
         # If you are using confirmable and the provider(s) you use validate emails,
         # uncomment the line below to skip the confirmation emails.
         user.skip_confirmation!
       end
     end
   end
  
end
