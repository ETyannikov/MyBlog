class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |blog|
      blog.string :title
      blog.text :body
      blog.string :image
      blog.integer :user_ID
      blog.integer :parent_post_ID
    end
  end
end
