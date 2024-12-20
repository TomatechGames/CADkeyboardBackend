class User < ApplicationRecord
  has_many :basket_items, dependent: :destroy
  has_many :keyboard_items, through: :basket_items
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  enum permissions: [:customer, :admin]
end
