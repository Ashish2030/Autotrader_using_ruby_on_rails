Rails.application.routes.draw do
  resources :line_items
  resources :carts
  resources :olds
  resources :cars
  resources :new_cars
  get 'home/index'
  devise_for :users
  root 'home#index'
  get 'gallery/index'
  get 'gallery/checkout'
  post 'gallery/checkout'
  get 'gallery/purchase_complete'
  get 'gallery/random'
  post 'gallery/search'
  get 'gallery/search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
