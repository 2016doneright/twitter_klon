module RetweetsHelper
   def retweeted?(tweet_id)
      a = current_user.retweets.pluck(:tweet_id)
      a.include?(tweet_id) 
   end
end
