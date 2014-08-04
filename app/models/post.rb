class Post < ActiveRecord::Base
  attr_accessible :body, :title
  belongs_to :category
end
