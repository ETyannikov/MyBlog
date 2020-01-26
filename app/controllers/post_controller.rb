require './config/environment'

class PostController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  get "/posts" do 
    @posts = Post.all
    erb :'posts/index'
  end
  
  get "posts/new" do
    erb :'posts/new'
  end

end
