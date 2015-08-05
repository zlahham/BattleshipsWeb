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
		$game = Game.new Player, Board
      def rand_coord_generator
    letter = [*('A'...'J')].shuffle[1,1].join
    number = [*('1'...'10')].shuffle[1,1].join
    (letter + number).to_sym
  end

  def rand_direction
    rand(1)
    if rand == 1
      :horizontally
    else
      :vertically
    end
  end
    erb :registered
  end

	post '/registered' do
	  $game = Game.new Player, Board
		@coord = params[:coord]
		$game.player_1.shoot(@coord.upcase.to_sym)
		erb :registered
	end

  # start the server if ruby file executed directly
  run! if app_file == $0



end
