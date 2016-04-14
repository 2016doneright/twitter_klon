class AroundController < ApplicationController
   def follow
    @user = User.find_by_profile_name(params[:profile_name])
    @success = current_user.follow(@user)  
   end
   
   def unfollow
    @user = User.find_by_profile_name(params[:profile_name])
    @success = current_user.stop_following(@user)
   end
    
end