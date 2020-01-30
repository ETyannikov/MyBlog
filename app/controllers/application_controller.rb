require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :sessions_secret, "Change this"
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :welcome
  end

end
