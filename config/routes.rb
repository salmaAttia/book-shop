Rails.application.routes.draw do
  post '/add_to_cart/:book_id' => 'cartitems#add_to_cart', :as => 'add_to_cart'
  post '/add_order/:cartitem_id' => 'orderitems#add_order', :as => 'add_order'
  post '/add_orders/:cart_id' => 'orderitems#add_orders', :as => 'add_orders'
  put '/remove_from_cart/:book_id' => 'cartitems#remove_from_cart', :as => 'remove_from_cart'
  delete '/delete_from_cart/:cartitem_id' => 'cartitems#delete_from_cart', :as => 'delete_from_cart'
  resources :books
  devise_for :users, :controllers => { :registrations => "user/registrations" }
  root 'pages#home'
  resources :carts, only: [:show]
  resources :orders, only: [:create]  
  resources :users, only: [:show, :index]
  delete '/delete_user/:cart_id/:user_id' => 'users#delete_user', :as => 'delete_user'
  get 'about', to: 'pages#about'
end
