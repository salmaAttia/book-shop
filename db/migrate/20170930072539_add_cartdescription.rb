class AddCartdescription < ActiveRecord::Migration[5.0]
  def change
    add_column :carts, :description, :string    
  end
end
