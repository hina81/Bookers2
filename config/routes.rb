Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get '/about', to: 'homes#about'
  resources :users, only: [:show, :edit, :index]
  resources :books, only: [:index, :show]
end
