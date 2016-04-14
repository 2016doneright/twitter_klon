class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  mount_uploader :cover, CoverUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :tweets, dependent: :destroy
  has_many :retweets, dependent: :destroy
  
  acts_as_follower
  acts_as_followable
  acts_as_voter
  
  
end
