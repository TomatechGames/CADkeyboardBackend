class BasketItem < ApplicationRecord
  belongs_to :user
  belongs_to :keyboard_item
end
