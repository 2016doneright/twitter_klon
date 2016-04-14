class BaseController < ApplicationController
    
    require 'will_paginate/array'
    
    def feed
        @following = current_user.following_users.ids.push(current_user.id)
        @feed = Tweet.where('user_id in (?)', @following).order('created_at desc').paginate(:page => params[:page], :per_page => 4)
        gon.following = current_user.following_users.pluck(:profile_name)
    end
end

=begin
following = current_user.following_users.ids.push(current_user.id)
                     @feed = PublicActivity::Activity.where('owner_id in (?)', @following).where('key is ?', 'tweet.create').order('created_at desc')
=end