Rails.application.routes.draw do
  resources :posts
  devise_for :users, controllers: { registrations: 'registrations' }

  resources :people
  resources :users do
    member do
      get :profile
    end
  end
  get 'home/index'
  get 'home/about'
  get 'home/profile'

  root to: "home#index"
  
end
