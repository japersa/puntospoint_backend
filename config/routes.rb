Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  # API routes
  namespace :api do
    namespace :v1 do
      post 'auth/login', to: 'authentication#login'
      get 'products/most_purchased', to: 'products#most_purchased'
      get 'products/top_revenue', to: 'products#top_revenue'
      get 'purchases/filter', to: 'purchases#filter'
      get 'purchases/granularity', to: 'purchases#granularity'
      post 'purchases', to: 'purchases#create' 
    end
  end
end
