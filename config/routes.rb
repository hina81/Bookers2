Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'home/about', to: 'homes#about', as: 'about'
  resources :users, only: [:show, :edit, :update, :index, :create]
  resources :books, only: [:index, :show, :create, :edit, :update, :destroy]
end
