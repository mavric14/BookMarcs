class MbookmarkController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  def index
    @categoies = User.joins(bookmarks: :category).where('users.id = ?', current_user.id).distinct
  end
  def destroy
 #    user = User.find(current_user.id)
 #    user.bookmarks.destroy(id: :id)
      Bookmark.destroy(params[:id])
     redirect_to mbookmark_index_path
  end
  
end