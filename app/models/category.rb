class Category < ActiveRecord::Base
  has_many :bookmarks
end
