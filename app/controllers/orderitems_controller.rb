class OrderitemsController < ApplicationController
    before_action :create_order, only: [:add_order, :add_orders]
    
    def add_order   
        @order.add_book_order(params[:cartitem_id])
        if @order.save
            flash[:sucess] = 'Order completed sucessfully'
            redirect_to user_path(current_user)
        else
            flash[:danger] = 'There is a problem with this order'  
            redirect_to user_path(current_user)  
         end      
    end

    def add_orders
        @cartitems = Cartitem.where(cart_id: params[:cart_id])
        @cartitems.each do |cartitem|   
            @order.add_book_order(cartitem.id)
            @order.save
        end        
    end
    
end