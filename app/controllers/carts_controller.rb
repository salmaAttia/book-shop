class CartsController < ApplicationController
  before_action :authenticate_user!
  def show
    @user_cart = current_user.cart
    @cartitems = @user_cart.cartitems
  end  
end    