require 'sinatra'
require 'sinatra/reloader'
require_relative 'deck.rb'
require_relative 'hand.rb'

get '/' do
  erb :blackjack
end

post '/' do
  deck = Deck.new
  player_hand = Hand.new( deck )
  dealer_hand = Hand.new( deck )

  print player_hand.cards

  erb :blackjack, locals: {  
    player_hand: player_hand, 
    dealer_hand: dealer_hand 
  }

end