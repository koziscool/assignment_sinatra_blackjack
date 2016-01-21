require 'sinatra'
require 'sinatra/reloader'
require_relative 'deck.rb'

get '/blackjack' do
  erb :blackjack
end

post '/' do
  player_hand = Hand.new
  dealer_hand = Hand.new


end