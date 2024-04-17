Rails.application.routes.draw do
  devise_for :users
  resources :people
  get 'home/index'
  get 'home/about'
  root to: "home#index"
  
end
