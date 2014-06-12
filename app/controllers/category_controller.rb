class CategoryController < ApplicationController
  def index
    @bookmarks = Bookmark.where(:category_id => params[:catid])
    @category = Category.where(:id => params[:catid])
  end

  def show
  end
end
