Rails.application.routes.draw do
  root "posts#index"
  
  resources :users, only: [:new, :create]
  resources :posts, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
