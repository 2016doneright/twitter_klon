class AddCoverAndAvatarToUser < ActiveRecord::Migration
  def change
    add_column :users, :cover, :string
    add_column :users, :avatar, :string
  end
end
