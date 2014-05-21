class AddBookMarkToUser < ActiveRecord::Migration
  def change
    add_column :users, :book_mark, :string
  end
end
