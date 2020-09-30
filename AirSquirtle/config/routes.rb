Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'pages#home' #changed the default rails homepage to our homepage!

  devise_for :users, path: '', path_names: {sign_in: 'login', sign_out: 'logout', edit: 'profile', sign_up: 'registration'}, controllers: {omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations'}

  resources :users, only: [:show] #we only want to create the path for showing user information. We don't want to do CRUD operations, bcause devise is taking care of that for us.
  resources :rooms, except: [:edit] do
    member do
      get 'listing'
      get 'pricing'
      get 'description'
      get 'photo_upload'
      get 'amenities'
      get 'location'
      get 'preload'
      get 'preview'
    end

    resources :photos, only: [:create, :destroy]
    resources :reservations, only: [:create]
    resources :calendars
  end

  resources :guest_reviews, only: [:create, :destroy]
  resources :host_reviews, only: [:create, :destroy]

  #if we type localhost:3000/your_trips it will run the reservation controller and your_trips action.
  get '/your_trips' => 'reservations#your_trips' 
  get '/your_reservations' => 'reservations#your_reservations' 

  get 'search' => 'pages#search'
  get 'dashboard', to: 'dashboards#index'

  resources :reservations, only: [:approve, :decline] do
    member do
      post '/approve', to: "reservations#approve"
      post '/decline', to: "reservations#decline"
    end
  end

  resources :conversations, only: [:index, :create] do 
    resources :messages, only: [:index, :create]
  end

  get '/host_calendar', to: "calendars#host"

  get '/notification_settings', to: "settings#edit"
  post '/notification_settings', to: "settings#update"
  
  get '/notifications', to: 'notifications#index' #notifications route...

  mount ActionCable.server => '/cable' #mounting action cable server for real time messages
end
