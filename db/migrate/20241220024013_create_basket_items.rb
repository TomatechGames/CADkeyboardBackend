class CreateBasketItems < ActiveRecord::Migration[7.2]
  def change
    create_table :basket_items do |t|
      t.references :user, null: false, foreign_key: true
      t.references :keyboard_item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
