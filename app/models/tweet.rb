class Tweet < ActiveRecord::Base
  
  include SimpleHashtag::Hashtaggable
  hashtaggable_attribute :content
  
  belongs_to :user
  mount_uploader :image, ImageUploader
  
  include PublicActivity::Model
  tracked
  
  acts_as_votable
  
  has_many :retweets
  
  validate :picture_size
  
  def picture_size
    if image.size > 1.megabytes
      errors.add(:image, "Please keep the image size below 1MB")
    end
  end
  
end
