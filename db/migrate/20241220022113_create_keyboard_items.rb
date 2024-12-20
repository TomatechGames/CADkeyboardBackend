class CreateKeyboardItems < ActiveRecord::Migration[7.2]
  def change
    create_table :keyboard_items do |t|
      t.string :name
      t.string :description
      t.string :manufacturer
      t.integer :amount
      t.float :price

      t.timestamps
    end
  end
end
