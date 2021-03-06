class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :content
      t.string :image
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
