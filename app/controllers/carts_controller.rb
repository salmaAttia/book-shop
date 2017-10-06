class CartsController < ApplicationController
  def show
    @user_cart = current_user.cart
    @cartitems = @user_cart.cartitems
  end  
end    