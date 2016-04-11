Rails.application.routes.draw do
  root 'static_sessions#index'
  get 'signin' => 'sessions#new'
  resources :users
  resources :sessions
  delete "/signout", to: "sessions#destroy"
  resources :attractions
  post 'rides/new', to: 'rides#create'


end
