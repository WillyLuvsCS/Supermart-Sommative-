Rails.application.routes.draw do
  get "invoices/new"
  get "invoices/create"
  get "order_items/index"
  get "suppliers/index"
  get "products/index"
  get "categories/index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "categories#index"
  resources :categories
  resources :suppliers
  resources :customers
  resources :employees
  resources :orders
  resources :order_items
  resources :products
  resources :stores
  resources :invoices, only: [:new, :create]
end
