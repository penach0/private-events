Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]

  resources :events
  resources :attendances, only: [:new, :create, :destroy]

  root "events#index"
end
