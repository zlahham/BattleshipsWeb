require 'sinatra/base'
require 'shotgun'

class BattleshipsWeb < Sinatra::Base
	set :views, proc { File.join(root, '..', 'views') }
  get '/' do
    erb :index
  end

  get '/new_game' do
    # @name = params[:name]
    erb :new_game
  end

  get '/registered' do
    @name = params[:name]
     erb :new_game
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
