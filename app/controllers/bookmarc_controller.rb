class BookmarcController < ApplicationController
  def index
    @categorys = Category.all
  end

  def new
  end

  def show
  end
end
