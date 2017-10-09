class OrdersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_order, only: [:show, :destroy]
    def index       
        @user_orders = current_user.orders
    end 
    def show       
        @orderitems = @order.orderitems
    end    
    def destroy
        @orderitems = @order.orderitems
        @orderitems.each do |orderitem|
            @book = Book.find(orderitem.book_id)
            @book.avamount = @book.avamount + orderitem.purched_amount
            @book.save
        end    
        @order.destroy
        flash[:danger] = "Order was successfully deleted"
        redirect_to orders_path
    end    
end 