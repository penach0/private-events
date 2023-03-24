Rails.application.routes.draw do
  devise_for :users
  get 'users/:id', to: "users#show"

  resources :events
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "events#index"
end
