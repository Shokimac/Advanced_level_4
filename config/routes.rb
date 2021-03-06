Rails.application.routes.draw do
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update]
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
  resources :relationships, only: [:create, :destroy]

  root 'home#top'
  get 'home/about'

end
