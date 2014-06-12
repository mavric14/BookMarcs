class LikeController < ApplicationController
  before_filter :authenticate_user!
  def create 
    @bookmark = Bookmark.find(params[:bmid])
    like = current_user.likes.build(bookmark: @bookmark)
    like.save
    @thisLike =Like.first
    puts "this id is " + @thisLike.bookmark_id.to_s + " and the user id is " + @thisLike.user_id.to_s
    redirect_to bookmarc_index_path
  end

  def destroy
    Like.destroy(params[:id])
    redirect_to bookmarc_index_path
  end
end
