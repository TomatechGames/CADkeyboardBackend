class KeyboardItem < ApplicationRecord
  has_many :borrowings, dependent: :destroy
  has_many :users, through: :borrowings
end
