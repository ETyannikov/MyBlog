require './config/environment'

class UserController < ApplicationController

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  get "/users/new" do
    erb :"/users/new"
  end
  
  post "/users" do
    @user = User.new(params)
    if params["username"].empty? || params["password"].empty?
      @error = "Username or password can't be blank"
      erb :"/users/new"
    elsif User.find_by username: (params["username"])
      @error = "That username is already taken"
      erb :"/users/new"
    else
      @user.save
      session[:user_id] = @user.id
      redirect "/posts"
    end
  end
  
  delete "/users/:id" do
    @user = User.find(params["id"])
    @user.destroy
    redirect '/posts'
  end
end