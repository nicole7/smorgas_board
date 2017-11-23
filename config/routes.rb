Rails.application.routes.draw do


  resources :users, only: [:create, :show]
  resources :sessions, only: [:create]
  resources :games

  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'register', to: 'users#new', as: 'register'

  root 'games#index'

end
