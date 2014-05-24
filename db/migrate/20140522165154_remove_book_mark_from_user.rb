class RemoveBookMarkFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :book_mark, :string
  end
end
