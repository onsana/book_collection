Rails.application.routes.draw do
  devise_for :users
  resources :books
  get "genres/:tag", to: "books#index", as: "genre"
  root to: "books#index"
end
