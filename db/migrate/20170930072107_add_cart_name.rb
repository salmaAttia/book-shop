class AddCartName < ActiveRecord::Migration[5.0]
  def change
    add_column :carts, :cartname, :string    
  end
end
