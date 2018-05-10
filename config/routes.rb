Rails.application.routes.draw do

  root to: "home#index"
  resources :friend_ships

  resources :friend_requests

  devise_for :users
  get 'users/search',to: "users#search", as: :search
  get 'users/show'

  resources :posts do
    resources :comments
  end






  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
