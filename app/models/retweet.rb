class Retweet < ActiveRecord::Base
  belongs_to :user
  belongs_to :tweet
  include PublicActivity::Model
  tracked
end
