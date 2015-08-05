require 'sinatra/base'
require 'shotgun'
require 'battleships'

class BattleshipsWeb < Sinatra::Base
	set :views, proc { File.join(root, '..', 'views') }
  get '/' do
    erb :index
  end

  get '/new_game' do
    erb :new_game
  end

  post '/new_game' do
    @name = params[:name]
    erb :new_game
  end

  get '/registered' do
    erb :registered
  end

  post '/registered' do
    erb :registered
  end

  get '/new_board' do
    "Hello"
    erb :new_board
  end

  post '/new_board' do
    "Hello"
    erb :new_board
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
