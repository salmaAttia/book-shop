class CreateCart < ActiveRecord::Migration[5.0]
  def change
    create_table :carts do |t|
      t.integer :user_id
    end
  end
end
