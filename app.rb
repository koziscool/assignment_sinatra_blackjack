require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/cookies'
require 'json'
require 'pry'
require_relative 'deck.rb'
require_relative 'hand.rb'
require_relative 'game.rb'


get '/' do
  game = Game.new
  deck = Deck.new
  deck.build_deck
  deck.shuffle

  game.deck = deck
  player_hand = Hand.new
  player_hand.starting_hand( deck )  
  game.player_hand = player_hand

  dealer_hand = Hand.new
  dealer_hand.starting_hand( deck )
  game.dealer_hand = dealer_hand

  response.set_cookie( "game_cookie", game.to_json )

  erb :blackjack, locals: {  game: game }
end

post '/' do
  game = Game.new
  game.recreate_from_json( request.cookies["game_cookie"] )
  erb :blackjack, locals: {  game: game }
end


post '/hit' do
  game = Game.new
  game.recreate_from_json( request.cookies["game_cookie"] )

  game.player_hand.hit( game.deck )

  puts game.player_hand.status
  response.set_cookie( "game_cookie", game.to_json )

  erb :blackjack, locals:  {  game: game }
end


post '/stay' do

  game = Game.new
  game.recreate_from_json( request.cookies["game_cookie"] )
  game.player_hand.stay
  game.evaluate_winner

   erb :blackjack, locals:  {  game: game }
end


