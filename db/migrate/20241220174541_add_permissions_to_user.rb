class AddPermissionsToUser < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :permissions, :integer
  end
end
