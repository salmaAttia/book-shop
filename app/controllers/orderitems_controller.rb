class OrderitemsController < ApplicationController
    before_action :create_order, only: [:add_order, :add_orders]
    def add_order   
        if @order.add_book_order(params[:cartitem_id])
            @order.save
            flash[:sucess] = 'Order completed sucessfully'
            redirect_to user_path(current_user)
        else
            @order.destroy
            flash[:danger] = 'There is a problem with this order'  
            redirect_to user_path(current_user)  
         end      
    end

    def add_orders
        @cartitems = Cartitem.where(cart_id: params[:cart_id])
        @cartitems.each do |cartitem|   
            if  @order.add_book_order(cartitem.id)
                 @order.save
            else
                @order_items = @order.orderitems
                @order_items.each do |orderitem|
                    @book = Book.find(orderitem.book_id)
                    @book.avamount = @book.avamount + orderitem.purched_amount
                    @book.save
                    orderitem.destroy 
                end    
                @order.destroy
                flash[:danger] = 'There is a problem with this order'   
            end
        end  
        redirect_to user_path(current_user)
    end 

    def delete_orderitem
        @order = Order.find(params[:order_id])
        @orderitem = Orderitem.find(params[:orderitem_id])
        @book = Book.find(@orderitem.book_id)
        @book.avamount = @book.avamount + @orderitem.purched_amount
        @book.save
        @orderitem.destroy
        @orderitems = @order.orderitems
        if not @orderitems.present?
            @order.destroy
        end    
        flash[:danger] = "Order was successfully deleted"
        redirect_to orders_path
    end    
end