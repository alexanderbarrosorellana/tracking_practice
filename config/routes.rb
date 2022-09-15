require 'sidekiq/web'

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "home#index"

  namespace :api do
    namespace :v1 do
      post :gps, action: :create, controller: 'gps_waypoints'
    end
  end

  get :show, action: :show, controller: 'vehicles'

  mount Sidekiq::Web => '/sidekiq'
end
