Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "user/registrations" }
  root 'pages#home'
  resources :users, only: [:show]
  get 'about', to: 'pages#about'
end
