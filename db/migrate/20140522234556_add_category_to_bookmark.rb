class AddCategoryToBookmark < ActiveRecord::Migration
  def change
    add_column :bookmarks, :category_id, :integer
    add_index :bookmarks, :category_id
  end
end
