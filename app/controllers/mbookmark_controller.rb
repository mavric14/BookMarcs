class MbookmarkController < ApplicationController
  before_filter :authenticate_user!, :except => [ :index, :show]
  def index
    @categoiesOfUsersBookMarks = User.joins(bookmarks: :category).where('users.id = ?', current_user.id).distinct.order('created_at')
   # puts "the cat of UBM is " + @categoiesOfUsersBookMarks.first.name + " the count is " + @categoiesOfUsersBookMarks.count.to_s 
    @categoriesFromLikes = Category.joins( bookmarks: { likes: :user } ).order('created_at').where('users.id = ?', current_user.id) 
   
    @categoies = @categoiesOfUsersBookMarks + @categoriesFromLikes
    

  end
  def destroy
 #    user = User.find(current_user.id)  :index,
 #    user.bookmarks.destroy(id: :id)
      Bookmark.destroy(params[:id])

     redirect_to mbookmark_index_path
  end
  
end