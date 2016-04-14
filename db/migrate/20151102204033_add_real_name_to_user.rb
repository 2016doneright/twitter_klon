class AddRealNameToUser < ActiveRecord::Migration
  def change
    add_column :users, :real_name, :string
    add_index :users, :real_name, unique: true
  end
end
