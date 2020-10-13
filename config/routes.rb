Rails.application.routes.draw do
  resources :reviews
  resources :favorite_restaurants
  resources :restaurants
  resources :locations
  resources :users
  resources :sessions, only: [:create]
  delete :logout, to: "sessions#logout"
  get :logged_in, to: "sessions#logged_in"
  resources :registrations, only: [:create]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
