class Cart < ApplicationRecord
    belongs_to :user
    has_many :cartitems, dependent: :destroy
    has_many :books, through: :cartitems

    def add_book(id)
        @book = Book.find(id)
        current_item = Cartitem.find_by(book_id: id, cart_id: self.id)
        if current_item 
            current_item.no_copies = (current_item.no_copies) + 1
            current_item.save
        else
            new_item = Cartitem.create(cart_id: self.id, book_id: id, no_copies: 1)
        end  
        new_item
    end  
    
    def remove_book(id)
        @book = Book.find(id)
        current_item = Cartitem.find_by(book_id: id, cart_id: self.id)
        if current_item.no_copies == 1
            current_item.destroy
        else
            current_item.no_copies = (current_item.no_copies) - 1
            current_item.save
        end  
    end     
end    
