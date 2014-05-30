class MbookmarkController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  def index
    @categoies = User.joins(bookmarks: :category).where('users.id = ?', current_user.id)
  end
end