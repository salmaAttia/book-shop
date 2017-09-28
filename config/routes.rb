Rails.application.routes.draw do
  resources :books
  devise_for :users, :controllers => { :registrations => "user/registrations" }
  root 'pages#home'
  resources :users, only: [:show, :index]
  get 'about', to: 'pages#about'
end
