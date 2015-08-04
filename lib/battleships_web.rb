require 'sinatra/base'
require_relative 'player'
require_relative 'game'

class BattleshipsWeb < Sinatra::Base
  set :views, proc {File.join(root,'..','views')}

  get '/' do
    erb :index
  end

  get '/new_game' do
    erb :new_game
  end

  get '/start_game' do
    @visitor = params[:first_name]
    Player1 = Player.new params[:first_name]
    Player2 = Player.new "COMPUTER"
    game = Game.new Player1, Player2
    erb :start_game
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
