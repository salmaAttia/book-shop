class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  private
    def set_cart
      @user = current_user
      @cart = Cart.find_by(user_id: @user.id)
    end 
    
    def create_order
      @order = Order.new(user_id: current_user.id)
      @order.save    
    end  
    
end
