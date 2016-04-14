class ProfilesController < ApplicationController
  before_action :authenticate_user!, except: [:show, :guest]
  
  require 'will_paginate/array'
  
  def show
      @user = User.find_by_profile_name(params[:profile_name])
      @tweets = @user.tweets.order('created_at desc').paginate(:page => params[:page], :per_page => 6)
  end
  
  def follow
    @user = User.find_by_profile_name(params[:profile_name])
    @success = current_user.follow(@user)
  end
  
  def unfollow
    @user = User.find_by_profile_name(params[:profile_name])
    @success = current_user.stop_following(@user)
  end
  
  def following
    @user = User.find_by_profile_name(params[:profile_name])
    @following_users = @user.following_users.order('created_at desc').paginate(:page => params[:page], :per_page => 6)
  end
  
  def followers
    @user = User.find_by_profile_name(params[:profile_name])
    @users_followers = @user.users_followers.order('created_at desc').paginate(:page => params[:page], :per_page => 6)
  end
  
   def likes
    @user = User.find_by_profile_name(params[:profile_name])
    @likes = @user.find_liked_items.reverse.paginate(:page => params[:page], :per_page => 4)
   end
  
  def tooltip 
    @user = User.find_by_profile_name(params[:profile_name])
  end
  
  def guest
   #real = Faker::Name.first_name + "" + Faker::Name.last_name
   #profile = real.gsub(/\s/,"_")
   #@user = User.create(email: Faker::Internet.email, password: "asdgasdgasdgasdgasdgasdg", profile_name: profile, #real_name: real)
    random_user = User.find(rand(1..25))
    sign_in(:user, random_user)
    redirect_to root_path
  end
  
end
