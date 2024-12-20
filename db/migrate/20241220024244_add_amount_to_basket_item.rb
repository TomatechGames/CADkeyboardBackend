class AddAmountToBasketItem < ActiveRecord::Migration[7.2]
  def change
    add_column :basket_items, :amount, :integer
  end
end
