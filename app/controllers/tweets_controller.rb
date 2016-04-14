class TweetsController < ApplicationController
  
    def show 
      @tweet = Tweet.find(params[:id])
    end
    
    def create
      @tweet = current_user.tweets.create(tweet_params)
      respond_to :js
    end
    
    def destroy
       @tweet = Tweet.find(params[:id])
      @tweet.create_activity :destroy, owner: current_user
       @tweet.destroy
    end
    
    def like
      @tweet = Tweet.find(params[:id])
      current_user.likes(@tweet)
      respond_to :js
    end
    
    def unlike
      @tweet = Tweet.find(params[:id])
      current_user.unlike(@tweet)
      respond_to :js
    end
    
    private
    
    
    def tweet_params
        params.require(:tweet).permit(:content, :image, :image_cache)
    end
end
