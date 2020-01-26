class Post < ActiveRecord::Base
  belongs_to :user
  has_many :posts
  belongs_to :posts
end