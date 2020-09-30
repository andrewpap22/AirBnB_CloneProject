# AirSquirtle! 
## AirBnB Clone using: (*Ruby on Rails*)

-----------------------------------------------------------------------------

*This is an undergraduate project for the course of **full stack web development of University of Athens, Department of Informatics & Telecommunications.** 
 The course had no exams at all, just this particular (not so easy) project. 
 So the **grading** of the project for the course was **100%**.*
 
 ----------------------------------------------------------------------------
 
 # Installation & Instructions: 
 
 *First and foremost inside the .pdf Project_Report file you can find EVERYTHING you would need to know about this project! The only 'problem' is that,
  it is written in **Greek** language. I'll provide here the requirements and installation instructions for the particular project in English (what needs to be installed, which machines, versions, etc...)
  but if u want to know details about the implementaion you'll have to translate some parts of the pdf file (using google translate, from Greek --> English) but in the future I'm planning to translate the whole pdf file.*
  
  * Another important thing I'm planning to add is a **docker file** so you won't need to go through the trouble of installing everything you would need to run the application on your machine!
  
  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  
  So, **let's start with the installation and requirements instructions:**
  
  *The instructions below, presupposes that you have **Linux** installed on your system.
   For Windows or MacOS users you'll have to adjust acordingly.* 
   
   1. You'll need to install the **Ruby 2.5 Version and Rails 5.0.3 Version** [Info.](https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-with-rbenv-on-ubuntu-18-04)
   2. Install **SQLite3** on your machine and the **DB Browser tool for SQLite3**. [Info.](https://sqlitebrowser.org/dl/)
   3. After successfully installing everything mentioned, open a terminal and cd to the project directory and type: **bundle install** (You must have installed the bundler from the info of the 1st link (alongside ruby, rails installation)).
   4. After completion and getting no errors (if you get any errors try to read the error and resolve it using google)(ruby usually gives us to the points errors and with a simple google search it is really possible that someone else might have already resolved it and usually it is a not matching version error.) 
   So as said if you get no errors you'll need to type: **rails db:migrate** to get a copy of the project's database to your own machine's local database that you installed on step 2.
   5. Supposing that you've successfully completed the step above you'll net to be inside the project directory (AirSquirtle) and type: **rails s** (to start the server) 
   and *hopefully* you'll get the server started successfully on port:3000 message without any errors and after that you can open your browser and type: **http://localhost:3000** and see the web application up and running on your browser!
   
   ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
   
   # Git Logs! 
   
   **At this point I'll provide all the git logs that I've made on this project (which you cant see in the actual logs above in the project because I commited the whole project directly from the submission University servers and the logs got lost.)**
   *This is a good point to mention that the logs are a bit more commented than should, so you can use them as a reference project implementation guide, so you might know exactly at which file, what code or what change was written/made and in which exact order it was made!* 
   
   ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
   
   ### **Initial Commit! ** {#initial-commit}


### **Create a simple Rails Project with Bootstrap** {#create-a-simple-rails-project-with-bootstrap}



1. install bootstrap gem

### 
**Create basic authentication** {#create-basic-authentication}

1. install devise gem

### 
**Building navbar with partial view** {#building-navbar-with-partial-view}

1. copy navbar static from bootstrap demo
2. create partial shared/navbar
3. add devise paths to navbar

### 
**Authentication with full name** {#authentication-with-full-name}

1. generate migration AddFullnameToUser fullname:string
2. add validations
3. add permissions for full name in devise in application controller

### 
**Update authentication views** {#update-authentication-views}

1. add bootstrap to devise forms
2. add name instead of email to shared/navbar

### 
**Gravatar** {#gravatar}

1. Update root path
2. Add avatar_url helper with css class for different size

### 
**Notification** {#notification}

1. Add toastr-rails gem
2. Add js and css for toastr
3. Add toastr for flash messages
4. Add toastr for devise messages to views

### 
**Sending transactional email with Gmail** {#sending-transactional-email-with-gmail}

1. Add gem figaro and configure -> info from comments
2. Add smtp configuration to development.rb
3. Change devise configuration
4. Add confirmable to user.rb
5. Add migration for confirmable
6. Problems with gmail solution in [Stack Overflow](https://stackoverflow.com/questions/25209676/running-into-smtp-error-when-trying-to-send-email-in-ror-app)

### 
**Sending transactional email with Mailgun** {#sending-transactional-email-with-mailgun}

1. Create mailgun account
2. Comment out gmail settings
3. Add credentials to config/application.yml
4. Change email address to valid one in devise.rb (config.mailer_sender = 'enter_valid_email_address_here')

### 
**Create Facebook app** {#create-facebook-app}


### 
**Create social authentication** {#create-social-authentication}

1. Add gem omniauth and omniauth-facebook
2. Generate migration AddFieldsToUser provider:string uid:string image:string
3. Add config.omniauth :facebook, 'API_KEY', 'API_SECRET', scope: 'email', info_fields: 'email, name' to devise.rb
4. Change 'API_KEY' and 'API_SECRET' to ENV['fb_app_id'] and ENV['fb_app_secret']
5. Add method self.from_omniauth(auth) to User
6. Add controller omniauth_callbacks_controller.rb and paste contents from [devise/omniauth](https://github.com/plataformatec/devise/wiki/OmniAuth:-Overview)
7. Add button to views/devise/sessions/new.html.erb and registrations/new
8. Modify routes.rb
9. Modify helper method to display avatar from fb as well
10. Solution to uninitialized Users [Stack Overflow](https://stackoverflow.com/questions/13537313/routing-error-uninitialized-constant-users?rq=1)

### 
**Styling views** {#styling-views}

1. Add styles and google fonts

### 
**Create user profile page** {#create-user-profile-page}

1. Generate migration - add phone_number and description to User
2. Add route for users :show
3. Create file users_controller.rb
4. Add styling for user show view

### 
**Create edit profile page** {#create-edit-profile-page}

1. Add styles and additional fields to profile page
2. Remove current password_field from registrations/edit
3. Create RegistrationsController

### 
**Create Room Model** {#create-room-model}

1. Rails g model Room with many fields
2. Add association to models

### 
**Create Room Controller** {#create-room-controller}

1. Rails g controller Rooms with many actions
2. Fill out Rooms controller actions
3. Update routes.rb

### 
**Create Room Views** {#create-room-views}

1. Create rooms/new view
2. Create sidebar
3. Create rooms/photo_upload view -> without uploads yet
4. Create rooms/listing view placeholder
5. Create rooms/amenities view placeholder
6. Create rooms/description view placeholder
7. Create rooms/location view placeholder
8. Create rooms/pricing view placeholder
9. Create partial for sidebar (link helpers are without @room and they are member routes)

### 
**Styling Views** {#styling-views}

1. Add styling to application.scss for form elements
2. Change class name for _room_menu.html.erb partial 
3. Correct few style mistakes 
4. Add some fronted validation to views

### 
**Install paperclip** {#install-paperclip}

1. Install ImageMagick "sudo apt-get install imagemagick"
2. Add gem paperclip

### 
**Create Photo Model** {#create-photo-model}

1. rails g model Photo room:references
2. rails g paperclip photo image
3. Add association to rooms and photos models
4. Add configuration to photo.rb from github gem page
5. Add routes for photos in rooms for create and destroy

### 
**Create Photo Controller** {#create-photo-controller}

1. Create photos_controller.rb
2. Modify rooms_controller
3. Add before_action to check if user is room owner

### 
**Create Photo View** {#create-photo-view}

1. Add form fields for file uploads for photos
2. Add _photos_list.html.erb partial for showing all photos
3. Add some styling for photos upload form

### 
**Remove Photos with AJAX** {#remove-photos-with-ajax}

1. Add rule in .gitignore to ignore photos
2. Add font awesome icons by adding link in head
3. Add link for removing photos in photos_list partial
4. Add destroy action to remove photos
5. Create photos/destroy.js.erb
6. Add http"S" to application helper for FB avatar

### 
**Amazon S3** {#amazon-s3}

1. Create new bucket on S3
2. Create new user IAM
3. Modify development.rb
4. Add keys to figaro
5. Add gem aws-sdk

### 
**Add Check to Room Views** {#add-check-to-room-views}

1. Add check to sidebar in room creation and logic to display if form was submitted
2. Add publish button
3. Add logic only to display publish button when everything is field in and active is false

### 
**Update the Photo Removing with AJAX** {#update-the-photo-removing-with-ajax}

1. Add ids to view
2. Add functionality to destroy.js.erb
3. Change room to class variable @room in photos_controller#destroy 

### 
**Issue with hidden fields** {#issue-with-hidden-fields}

1. In rooms_controller create private method
2. Merge hash with active: true if room is ready to prevent issue with changing code by user 

### 
**Create Room Index Page** {#create-room-index-page}

1. Create rooms/index.html.erb layout
2. Add default photo to listing if it doesn't have image
3. Copy blank.jpg to assets/images
4. Create method in model room.rb cover_photo 

### 
**Create Room Show Page** {#create-room-show-page}

1. Modify show.html.erb
2. Add toastr global config in application.js 
3. Add styles for strikethrough

### 
**Add Google Map** {#add-google-map}

1. Add gem geocoder
2. Add longitude and latitude to room
3. Add geocoded_by :address to room.rb model
4. Restart server and re enter address
5. Add script for google maps without API KEY 

### 
**Add Nearby Rooms** {#add-nearby-rooms}

1. Add nearby apartments to show.html.erb using geocoder
2. Added code to enable map loading when changing to nearby room -> (errors in console to solve)
3. Change units to km from miles in initializers/geocoder.rb

### 
**Create Reservations Model** {#create-reservations-model}

1. rails g model Reservation user:references room:references start_date:datetime end_date:datetime price:integer total:integer
2. Add has_many :reservations to user and room
3. Add nested route for reservations 

### 
**Create Reservations View** {#create-reservations-view}

1. Add partial to room view
2. Add reservations/_form.html.erb 

### 
**Create Reservations Controller** {#create-reservations-controller}

1. Add reservations_controller.rb 

### 
**Add jQuery Date Picker** {#add-jquery-date-picker}

1. Add jquery-ui-rails gem
2. Add js require to application.js
3. Add script to _form.html.erb
4. Add stylesheet in tag for jquery ui theme 

### 
**Refactoring Reservation Form** {#refactoring-reservation-form}

1. Add styles to right side booking form in room#show
2. Add styles for table in reservation form 

### 
**AJAX for start date** {#ajax-for-start-date}

1. Add preload method in rooms_controller to respond with json
2. Add route for rooms_controller#preload
3. Add AJAX for retrieving reservations in _form.html.erb partial
4. Add reservations to calendar
5. Can't select date before and after reservation and remove disabled when selected 

### 
**AJAX for end date** {#ajax-for-end-date}

1. Add is_conflivt private method in rooms_controller
2. Add action preview in rooms_controller
3. Add route preview
4. Add js logic in view reservations/_form.html.erb to handle request to rooms/:id/preview
5. Add js logic to display preview - nights, price, total etc
6. Add css for message

### 
**Create Your Trips Page** {#create-your-trips-page}

1. Add action your_trips in reservations_controller
2. Add route for trips
3. Create view for trips 

### 
**Create Your Reservations Page** {#create-your-reservations-page}

1. Add action your_reservations in reservations_controller
2. Add route
3. Add view for reservations
4. Copy sidebar from reservations to trips and listings
5. Update links in shared/_navbar.html.erb
6. Add button to navbar 

### 
**Modify User Profile Page** {#modify-user-profile-page}

1. Add @rooms to users_controller
2. Modify show.html.erb to show if user confirmed email or sign up with FB
3. Add rooms to profile

### 
**Creating Reviews Model** {#creating-reviews-model}

1. rails g model Review comment:text star:integer room:references reservation:references guest:references host:references type
2. rails g model GuestReview --parent=Review --migration=false
3. rails g model HostReview --parent=Review --migration=false
4. add default: 1 to star in migration
5. add belongs_to :guest, class_name: "User" to guest_review model
6. remove every belongs_to from review.rb model
7. Add has_many :guest_reviews to room.rb and helper method
8. Add has_many :guest_reviews, class_name: "GuestReview", foreign_key: "guest_id" to user.rb as well for Host

### 
**Creating Reviews Controller** {#creating-reviews-controller}

1. Add host_reviews_controller.rb
2. Copy to guest_reviews_controller.rb
3. Add routes 

### 
**Creating Reviews View** {#creating-reviews-view}

1. Get code for bootstrap modal
2. Create views/reviews/_guest_form.html.erb
3. Create views/reviews/_host_form.html.erb
4. Add button to your_trips with partial
5. Add button to your_reservations partial
6. Change modal id to be dynamic in views 

### 
**Create Show Reviews Page** {#create-show-reviews-page}

1. Add instance variable to rooms_controller
2. Add instance variable to users_controller to display reviews as aguest and as a host
3. Create reviews/_guest_list.html.erb
4. Create reviews/_host_list.html.erb
5. Update room page and user page with comments partials 

### 
**Adding jquery raty** {#adding-jquery-raty}

1. Create jquery.raty.js and paste from [Raty](https://github.com/wbotelhos/raty/blob/master/lib/jquery.raty.js)
2. Add images from folder from tutorial to assets/images

### 
**Add stars to reviews** {#add-stars-to-reviews}

1. Add stars to guest_form and host_form
2. Add stars to rooms/show.html.erb
3. Add stars to guest_list and host
4. Add id for modals 

### 
**Update Home Page** {#update-home-page}

1. Add @rooms to pages_controller.rb
2. Modify pages#home view
3. Add search form to home view
4. Add jquery for datepicker 

### 
**Creating Search Page** {#creating-search-page}

1. In page controller add action search
2. Add search to routes.rb
3. Add file views/pages/search.html.erb
4. Add stylesheet rules for search page
5. Add search fields to view search.html.erb 

### 
**Create search function** {#create-search-function}

1. Add gem 'ransack'
2. Implement search in pages_controller.rb
3. Add code to search.html.erb to display results 

### 
**Add Google Map** {#add-google-map}

1. Transform search criteria to look better on search.html.erb
2. Add button to hide and open filters
3. Add google map with all found rooms
4. Add css for class of map markers
5. Add search form to navbar 

### 
**AJAX Searching** {#ajax-searching}

1. Create rooms/_room_list.html.erb
2. Create /pages/search.js.erb
3. Change search.html.erb
4. Update google map with ajax 

### 
**Add jquery pricing slider** {#add-jquery-pricing-slider}

1. Add require rule to assets/application.js
2. Add jquery to search.html.erb for sliders
3. Add some styling with jquery 

### 
**Modify Home Page** {#modify-home-page}

1. Add images and h1 to home.html.erb
2. Add images to assets/images
3. Add stylesheet css rules 

### 
**Improving Home Page** {#improving-home-page}

1. Change home page with partial
2. Change show user to use partial
3. Add some information to _rooms_list.html.erb partial
4. Add script for stars and reviews count 

### 
**Auto Location Suggestion** {#auto-location-suggestion}

1. Use [geocomplete](https://github.com/ubilabs/geocomplete)
2. Get google maps api key
3. Add link to application.html.erb
4. Create geocomplete.js file in javascripts and copy contents from geocomplete github
5. Add id to form in home.html.erb and script
6. Add css to hide scrollbars in search
7. Add autolocation to manage listing

### 
**Dashboard Controller** {#dashboard-controller}

1. Add dashboards_controller.rb
2. Add route for index action in dashboards_controller
3. Add rule for devise to redirect to dashboard after user sign in 

### 
**Dashboard View** {#dashboard-view}

1. Add views/dashboards, add index.html.erb
2. Add link to user profile in rooms/show.html.erb 
3. Add simple structure to the dashboard
4. Add style to navbar and more links in dropdown
5. Add additional navbar for sign in users on specific pages
6. Add active links to new navbar 

### 
**Instant/Request Booking Model** {#instant-request-booking-model}

1. rails g migration AddInstantToRooms instant:integer
2. rails g migration AddStatusToReservations status:integer
3. add code to migrations for default value
4. Add enum attributes to room and reservation model

### 
**Instant/Request Booking Function** {#instant-request-booking-function}

1. Add :instant in room_params in rooms_controller
2. Add Booking Type select to rooms/new.html.erb
3. Add Booking Type select to rooms/listing.html.erb
4. Add logic to reservations_controller
5. Add different buttons to reservations/_form.html.erb

### 
**Approve/Decline Reservations** {#approve-decline-reservations}

1. Create approve and decline in reservaions_controller
2. Add routes for new actions
3. Add buttons for approving/declining in reservations/your_reservations
4. Show status in your_trips.html.erb

### 
**Reservation status** {#reservation-status}

1. Add conditional to show review button only on approved reservations in views
2. Update logic on reservation form in rooms_controller
3. Update search action in pages_controller 

### 
**Calendar Controller** {#calendar-controller}

1. Add gems fullcalendar-rails and moment js-rails [link](https://github.com/bokmann/fullcalendar-rails)
2. Implement js and css in application.js and .scss
3. Create calendars_controller.rb
4. Add routes 

### 
**Host Calendar Page** {#host-calendar-page}

1. Create calendars/host.html.erb
2. Correct image display in calendar controller
3. Add css for calendar

### 
**Improving Host Calendar** {#improving-host-calendar}

1. Add date checking in js in host.html.erb for dates so the reservation will display correctly
2. Add search form for changing rooms
3. Add logic to controller for ransack search
4. Asynchronous reload of calendar. Add remote to form in view.
5. Add host.je.erb

### 
**Calendar Next/Back** {#calendar-next-back}

1. Add js to host.html.erb to trigger on change when pressing next/prev buttons
2. Add host calendar link to navbar

### 
**Calendar availability model** {#calendar-availability-model}

1. Add price display to host calendar
2. Add css for price
3. rails g model Calendar day:date price:integer status:integer room:references
4. Add relation to room.rb
5. Add enum to calendar.rb
6. Add routes as nested resource in rooms

### 
**Calendar Availability Form** {#calendar-availability-form}

1. Add /calendars/_form.html.erb
2. Add form to host calendar
3. Add js code for opening modal

### 
**Calendar Pricing** {#calendar-pricing}

1. Add style for radio buttons
2. Add create action and calendar_params to calendars_ccontroler
3. Modify host action in calendars_controller
4. Add in dayRender function in host.html.erb to add days data to calendar
5. Add reloading for arrows to host.js.erb 

### 
**Sending Email for a Successful Booking (could not get it to work)** {#sending-email-for-a-successful-booking-could-not-get-it-to-work}

1. Create mailers/reservation_mailer.rb - getemoji.com
2. Create folder in views/reservation_mailer
3. Create file send_email_to_guest.html.erb
4. Add line for sending email in reservaions_controller

### 
**Conversations and Messages Model** {#conversations-and-messages-model}

1. rails g model Conversation sender_id:integer recipient_id:integer
2. rails g model Message context:text user:references conversation:references
3. Add relations, scopes and validations to converstaion.rb model
4. Add validation to message.rb model and add conversion of time

### 
**Conversations and Messages Controller** {#conversations-and-messages-controller}

1. Create file conversations_controller.rb
2. Create messages_controller.rb
3. Add routes for controllers

### 
**Conversations and Messages View** {#conversations-and-messages-view}

1. Create conversations folder and index.html.erb
2. Create messages folder and index.html.erb
3. Add link to conversations in users/show view
4. Add message link in shared/navbar
5. Some fixes of typos content changed to context
6. Add partial for messages
7. Change displaying of time to time_ago_in_words

### 
**Action Cable Configuration** {#action-cable-configuration}

1. In routes.rb mount ActionCable server
2. Establish socket connection for client side in application.js
3. Specify socket uri in config/enviroments/development.rb
4. Add ActionCable metatag in application.html.erb

### 
**Real time messages** {#real-time-messages}

1. rails g channel messages
2. add stream_from to channels/messages_channel.rb
3. Define when should channel broadcast in messages_controller.rb
4. Modify assets/javascripts/channels/messages.coffee
5. In messages/index.html.erb add remote: true
6. Change messages coffee to incorporate $() to load javascript better 

### 
**Notification Model** {#notification-model}

1. rails g model Notification content user:references
2. rails g migration AddUnreadToUser unread:integer
3. Add default: 0 to unread migration
4. Add relationships to user.rb model
5. Add after_create_commit to notification.rb model
6. Add cerate_notification in message.rb model
7. Add create_notification in reservation.rb model 

### 
**Notification Controller** {#notification-controller}

1. Add notifications_controller.rb
2. rails g channel notifications
3. Add code to notifications.coffee
4. Modify notifications_channel.rb
5. rails g job notification
6. Modify jobs/notification_job.rb
7. Add route for notifications in routes.rb

### 
**Notification View** {#notification-view}

1. Add notifications folder
2. Add index.html.erb for notifications
3. Create partial for notification
4. Add Notification count to dashboard/index.html.erb
5. Add hidden field with user id to layouts/application.html.erb

### 
**Improving Notification View** {#improving-notification-view}

1. Add icon to shared/_navbar
2. Add css for new class in application.scss
3. Add code to show up number of notifications to notifications.coffee

### 
**Update Room Searching Function** {#update-room-searching-function}

1. Update pages_controller.rb

### 
**Unavailable Dates on Date Pickers** {#unavailable-dates-on-date-pickers}

1. Add logic to get unavailable_dates in rooms_controller
2. Add javascript to reservations/_form.html.erb
3. Update is_conflict method in rooms_controller
4. Clean up code in _form.html.erb

### 
**Last Commit! Done!** {#last-commit-done}


--------------------------------------------

At this point we're done! Thank you! 

Andrew Pappas :copyright: 2020, All rights Reserved! 
