require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/cookies'
require 'json'
require 'pry'
require_relative 'deck.rb'
require_relative 'hand.rb'


helpers do 
 
end


get '/' do
  erb :blackjack
end

post '/' do
  deck = Deck.new
  deck.build_deck
  deck.shuffle

  player_hand = Hand.new
  player_hand.starting_hand( deck )
  response.set_cookie( "player_hand_cookie", player_hand.to_json )

  
  dealer_hand = Hand.new
  dealer_hand.starting_hand( deck )
  response.set_cookie( "dealer_hand_cookie", dealer_hand.to_json )

  response.set_cookie( "deck_cookie", deck.to_json )

  erb :blackjack, locals: {  
    player_hand: player_hand, 
    dealer_hand: dealer_hand 
  }

end


post '/hit' do
 

  deck = Deck.new
  # print  request.cookies["deck_cookie"]

  deck.recreate_from_json( request.cookies["deck_cookie"] )

  player_hand = Hand.new
  player_hand.recreate_from_json(request.cookies["player_hand_cookie"] )

  dealer_hand = Hand.new
  dealer_hand.recreate_from_json(request.cookies["dealer_hand_cookie"] )

  player_hand.hit( deck )

  response.set_cookie( "player_hand_cookie", player_hand.to_json )
  response.set_cookie( "deck_cookie", deck.to_json )

  erb :blackjack, locals: {  
  player_hand: player_hand, 
  dealer_hand: dealer_hand}


end


post '/stay' do
  deck = Deck.new
  # print  request.cookies["deck_cookie"]

  deck.recreate_from_json(request.cookies["deck_cookie"] )

  player_hand = Hand.new
  player_hand.recreate_from_json(request.cookies["player_hand_cookie"] )

   dealer_hand = Hand.new
  dealer_hand.recreate_from_json(request.cookies["dealer_hand_cookie"] )

  player_hand.stay

   erb :blackjack, locals: {  
  player_hand: player_hand, 
  dealer_hand: dealer_hand}

end


