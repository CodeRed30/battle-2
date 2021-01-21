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

  get '/test_infrastructure' do
    'Testing infrastructure working!'
  end

  get '/' do
    erb(:index)
  end

  post '/names' do
    $player_1 = Player.new(params[:player_1_name])
    $player_2 = Player.new(params[:player_2_name])
    redirect '/play'
  end

  get '/play' do
    @player_1 = $player_1
    @player_2 = $player_2
    erb(:play)
  end

  post '/attack' do
    @player_1 = $player_1
    @player_2 = $player_2
    Game.new.attack(@player_2)
    erb(:attack)
  end

  run! if app_file == $PROGRAM_NAME
end
