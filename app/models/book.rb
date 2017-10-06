class Book < ApplicationRecord
    validates :name, presence: true, length: { minimum: 3, maximum: 50 }
    validates :description, presence: true, length: { minimum: 10, maximum: 300 }
    has_attached_file :avatar, styles: {
        thumb: "500x500>"}
    has_many :cartitems, dependent: :destroy
    has_many :carts, through: :cartitems
    has_many :orderitems
    has_many :orders, through: :orderitems 
end    
