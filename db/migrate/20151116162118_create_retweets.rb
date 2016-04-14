class CreateRetweets < ActiveRecord::Migration
  def change
    create_table :retweets do |t|
      t.references :tweet
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :retweets, [:user_id, :tweet_id], unique: true
  end
end
