class CreateOrderitem < ActiveRecord::Migration[5.0]
  def change
    create_table :orderitems do |t|
      t.integer :order_id
      t.integer :book_id
      t.float :purched_price
      t.integer :purched_amount
    end
  end
end
