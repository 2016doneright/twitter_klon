class HashtagsController < ApplicationController

  def index
    @hashtags = SimpleHashtag::Hashtag.all
  end

  def show
    @hashtag = SimpleHashtag::Hashtag.find_by_name(params[:hashtag])
    @hashtagged_posts = @hashtag.hashtaggables.map(&:id).uniq
    @hashtagged = Tweet.where('id in (?)', @hashtagged_posts).paginate(:page => params[:page], :per_page => 5)
  end

end
