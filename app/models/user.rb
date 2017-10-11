class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_attached_file :avatar, styles: {
    thumb: "150x150>"}, default_url: "ano_pic.jpg"
  has_one :cart, dependent: :destroy
  has_many :orders, dependent: :destroy
end
