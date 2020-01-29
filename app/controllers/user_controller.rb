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
    if @user.username.empty? || @user.password1.empty?
      redirect "/users/new"
    elsif @user.password1 != @user.password2
      redirect "/users/new"
    else
      @user.save
      redirect "/posts"
    end
  end
  
  delete "/users/:id" do
    @user = User.find(params["id"])
    @user.destroy
    redirect '/posts'
  end
end