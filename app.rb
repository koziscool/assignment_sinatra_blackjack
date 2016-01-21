require 'sinatra'
require 'sinatra/reloader'
require_relative 'deck.rb'

get '/' do
  erb :blackjack
end

post '/' do
  deck = Deck.new
  player_hand = Hand.new( deck )
  dealer_hand = Hand.new( deck )

end