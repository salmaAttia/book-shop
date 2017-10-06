class CreateCartItem < ActiveRecord::Migration[5.0]
  def change
    create_table :cartItems do |t|
      t.integer :cart_id
      t.integer :book_id
      t.integer :no_copies
    end
  end
end
