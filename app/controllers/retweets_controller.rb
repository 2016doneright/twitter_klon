class RetweetsController < ApplicationController
  
  def create
    @tweet = Tweet.find(params[:tweet_id])
    @retweet = current_user.retweets.create(tweet_id: params[:tweet_id])
    respond_to :js
  end
  
  def destroy
    @tweet = Tweet.find(params[:id])
    @retweet = Retweet.where(tweet_id: @tweet, user_id: current_user)
    Retweet.destroy(@retweet)
    respond_to :js
  end
  
end
