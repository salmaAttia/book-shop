class Order < ApplicationRecord
    belongs_to :user
    has_many :orderitems, dependent: :destroy
    has_many :books, through: :orderitems

    def add_book_order(id)
        @cartitem = Cartitem.find(id)
        @book = Book.find(@cartitem.book_id)
        new_item = Orderitem.create(order_id: self.id, book_id: @book.id, purched_amount: @cartitem.no_copies, purched_price: @book.currentPrice) 
        new_item
    end  
end