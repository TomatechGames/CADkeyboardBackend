class User < ApplicationRecord
  has_many :borrowings, dependent: :destroy
  has_many :keyboard_items, through: :borrowings
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
