class ActivitiesController < ApplicationController
  
  def mine
    @activity = PublicActivity::Activity.where(owner_id: current_user).order(created_at: :desc)
  end
  
  def following
    @following = current_user.following_users.ids
    @activity = PublicActivity::Activity.where('owner_id in (?)', @following).order(created_at: :desc)
  end
  
end