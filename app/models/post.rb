class Post < ActiveRecord::Base
  attr_accessible :body, :title, :category_id
  belongs_to :category
end
