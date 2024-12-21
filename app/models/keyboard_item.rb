class KeyboardItem < ApplicationRecord
  has_many :basket_items, dependent: :destroy
  has_many :users, through: :basket_items

  def self.ransackable_attributes(auth_object = nil)
    ["manufacturer", "name"]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end
