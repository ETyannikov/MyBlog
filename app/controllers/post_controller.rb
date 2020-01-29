require './config/environment'

class PostController < ApplicationController

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  def valid?(param)
    if param["title"].empty? || param["body"].empty?
      false
    else
      true
    end
  end

  
  #index
  get "/posts" do 
    @posts = Post.all.reverse
    erb :'posts/index'
  end
  
  #new
  get "/posts/new" do
    erb :'posts/new'
  end
  
  #show
  get "/posts/:id" do
    @post = Post.find(params["id"])
    erb :'posts/show'
  end
  
  #new save
  post "/posts" do
    if valid?(params)
      @post = Post.new(params)
      @post.save
      redirect "/posts"
    else
      erb :'posts/new'
    end
  end
  
  #edit
  get "/posts/:id/edit" do
    @post = Post.find(params["id"])
    erb :'posts/edit'
  end
  
  #update
  patch "/posts/:id" do
    @post = Post.find(params["id"])
    if valid?(params)
      @post.update(title: params["title"], body: params["body"], image: params["image"])
      redirect "/posts/#{@post.id}"
    else
      redirect "/posts/#{@post.id}/edit"
    end
  end
  
  #delete
  delete '/posts/:id' do 
    @post = Post.find(params["id"])
    @post.destroy
    redirect '/posts'
  end
end
