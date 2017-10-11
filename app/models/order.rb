class Order < ApplicationRecord
    belongs_to :user
    has_many :orderitems, dependent: :destroy
    has_many :books, through: :orderitems

    def add_book_order(id)
        @cartitem = Cartitem.find(id)
        @book = Book.find(@cartitem.book_id)
        if @book.avamount >=  @cartitem.no_copies
            @book.avamount = @book.avamount - @cartitem.no_copies
            new_item = Orderitem.create(order_id: self.id, book_id: @book.id, purched_amount: @cartitem.no_copies, purched_price: @book.currentPrice) 
            @book.save
            return true
        end
        return false     
    end  
end