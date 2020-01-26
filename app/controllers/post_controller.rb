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
  
  get "/posts/new" do
    erb :'posts/new'
  end
  
  post "/posts" do
    bpost = Post.new(params)
    if bpost.save 
        redirect "/posts" 
      else
        erb :'posts/new'
    end
  end

end
