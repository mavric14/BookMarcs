class BookmarcController < ApplicationController
before_filter :authenticate_user!, :except => [:index, :show]
  def index
    @categoies = Category.all
    @categoiesDistinctBm = @categoies.uniq{|bookmark| bookmark.url}
   # puts "the name issssss " + @categoies[0].name
  end

  def new
  end

  def show
  end

  def create
    
    user = User.find(current_user.id)
   
    user.bookmarks.create(url: params[:bmurl], category_id: params[:catid])
    redirect_to mbookmark_index_path
  end
end
