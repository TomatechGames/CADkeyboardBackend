class KeyboardItem < ApplicationRecord
  has_many :basket_items, dependent: :destroy
  has_many :users, through: :basket_items
end
