class CartitemsController < ApplicationController
    before_action :set_cart, only: [:remove_from_cart, :add_to_cart]
   
    def add_to_cart       
        @cart.add_book(params[:book_id])
        if @cart.save
            flash[:sucess] = 'The book is add to the cart sucessfully'
            redirect_to cart_path(current_user.cart)
        else
            flash[:danger] = 'There is a problem on adding this item to the cart'  
            redirect_to books_path  
        end   
    end
    def remove_from_cart
        @cart.remove_book(params[:book_id])
        redirect_to cart_path(current_user.cart)
    end    
    def delete_from_cart
        @cartitem = Cartitem.find(params[:cartitem_id])
        @cartitem.destroy
        redirect_to cart_path(current_user.cart)
    end  
    
end