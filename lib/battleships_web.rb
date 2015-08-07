require 'sinatra/base'
require 'shotgun'
require 'battleships'

class BattleshipsWeb < Sinatra::Base
  enable :sessions
  
  set :views, proc { File.join(root, '..', 'views') }
  set :public, proc { File.join(root, '..', 'public') }

  get '/' do
    erb :index
  end

  get '/new_game' do
    erb :new_game
  end

  post '/new_game' do
    # if session[:name]
    #   @name = session[:name]
    # else
      @name = params[:name]
    # end
    @name_2 = params[:name_2]
    session[:name] = @name
    raise AppError if @name == "Bill"

    p session
    erb :new_game
  end

  get '/registered' do
    $game = Game.new Player, Board
    $game.player_2.place_ship Ship.battleship, :A1, :horizontally
   # $game.player_2.place_ship Ship.aircraft_carrier, :A2, :horizontally
   # $game.player_2.place_ship Ship.submarine, :A3, :horizontally 
   # $game.player_2.place_ship Ship.destroyer, :A4, :horizontally
   # $game.player_2.place_ship Ship.cruiser, :A5, :horizontally
    
    @something = session[:name]
    erb :registered
  end

  post '/registered' do
    @ship_type = params[:ship_type]
    @ship_coord = params[:ship_coord]
    @ship_direction = params[:ship_direction]
    $game.player_1.place_ship Ship.battleship, @ship_coord.upcase.to_sym, @ship_direction.downcase.to_sym

     # raise AppError if @coord == "A0"

    erb :registered
  end

  get '/game_play' do

    erb :game_play
  end

  post '/game_play' do
    @coord = params[:coord]
    # $game.player_1.shoot(@coord.upcase.to_sym)
    begin
      if  $game.player_1.shoot(@coord.upcase.to_sym) == :hit
        @hit = true
      else
        @hit = false
      end
      rescue RuntimeError
        @coordinate_already_been_shot_at = true
        p "Master Blaster"
    end

    redirect '/result' if $game.has_winner?

    erb :game_play
  end

  get '/result' do
    
    erb :result
  end


  error 'AppError' do
    status 404
   erb :custom_error
  end


  not_found do
    status 404

    erb :custom_404
  end

  # start the server if ruby file executed directly
  run! if app_file == $0

end