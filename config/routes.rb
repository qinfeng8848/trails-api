Rails.application.routes.draw do
  devise_for :users

  root "welcome#index"
  namespace :api,:default => {:format =>:json} do
    namespace :v1 do
      get "/trains" => "trains#index", :as => :trains
      get "/trains/:train_number" => "trains#show", :as => :train
      get "/reservations" => "reservations#index", :as => :reservations
      get "reservations/:booking_code" => "reservations#show", :as => :reservation
      post "reservations" => "reservations#create", :as => :create_reservations
      patch "reservations/:booking_code" => "reservations#update", :as => :update_reservations
      delete "reservations/:booking_code" => "reservations#destroy", :as => :destroy_reservations

      post "/signup" => "auth#signup"
      post "/login" => "auth#login"
      post "/logout" => "auth#logout"
    end
  end

end
