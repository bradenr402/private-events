class AddNameToUsers < ActiveRecord::Migration[7.0]
  def up
    add_column :users, :name, :string
    change_column_null :users, :name, false
  end

  def down
    remove_column :users, :name, :string
  end
end
