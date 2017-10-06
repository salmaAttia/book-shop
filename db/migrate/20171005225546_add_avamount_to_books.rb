class AddAvamountToBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :avamount, :integer
  end
end
