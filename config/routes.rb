Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token
  resources :products
  resources :sessions, only: [ :new, :create, :destroy, :index ]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Route for the welcome dashboard page
  get "dashboard" => "dashboard#index", as: :dashboard

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Custom route for login
  get "/login", to: "sessions#new", as: "login"

  # Custom route for new password
  # get "/password/new", to: "passwords#new", as: "new_password"

  # Defines the root path route ("/")
  root "products#index"

  # Optionally set the dashboard as the root path
  # root "dashboard#index"
end
