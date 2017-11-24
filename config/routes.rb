Rails.application.routes.draw do


  resources :users, only: [:create, :show, :index]do
    get '/friend_requests', to: 'friend_requests#index'
    get '/friends', to: 'friendships#index'
  end
  resources :sessions, only: [:create]
  resources :games

  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'register', to: 'users#new', as: 'register'

  root 'games#index'

  # resources :users, only: [:show index] do
  #   get '/friend_requests', to: 'friend_requests#index'
  #   get '/friends', to: 'friendships#index'
  # end

  resources :requests, only: [:create, :update, :destroy]
  resources :friendings, only: :destroy

end
