class BookmarcController < ApplicationController
before_filter :authenticate_user!, :except => [:index, :show]
  def index
    @categoies = Category.all
   # puts "the name issssss " + @categoies[0].name
  end

  def new
  end

  def show
  end

  def create
    puts "I am creating...."
    user = User.find(current_user.id)

    puts user.email

    p = params[:bmurl]

    puts p    
    user.bookmarks.create(url: params[:bmurl], category_id: params[:catid])
    redirect_to mbookmark_index_path
  end
end
