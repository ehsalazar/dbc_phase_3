class Post < ActiveRecord::Base
  attr_accessible :body, :title, :category_id
  validates :title, :body, :category, :presence => true
  belongs_to :category
end
