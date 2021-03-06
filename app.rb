# frozen_string_literal: true

require 'sinatra'
require 'sinatra/base'
require 'sinatra/reloader'
require './lib/player'
require './lib/game'

# The Battle class is the main game class.
class Battle < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  # enable :sessions
  before do
    @game = Game.instance
  end

  get '/test_infrastructure' do
    'Testing infrastructure working!'
  end

  get '/' do
    erb(:index)
  end

  post '/names' do
    @game = Game.create(Player.new(params[:player_1_name]), Player.new(params[:player_2_name]))
    redirect '/play'
  end

  get '/play' do
    erb(:play)
  end

  post '/attack' do
    if @game.attack
      erb(:attack)
    else
      redirect '/end_game'
    end
  end

  get '/end_game' do
    erb(:end_game)
  end

  run! if app_file == $PROGRAM_NAME
end
