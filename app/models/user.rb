class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_attached_file :avatar  
  validates_attachment_content_type :item, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif", "application/pdf"]
end
