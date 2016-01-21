require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/cookies'
require_relative 'deck.rb'
require_relative 'hand.rb'


helpers do 
  def gen_cookie(array, cookie_name) 
    s = array.reduce("") do |str, card| 
    str + card.to_s
    end
    response.set_cookie(cookie_name, s)
  end
end



get '/' do
  erb :blackjack
end

post '/' do
  deck = Deck.new
  deck.shuffle
  player_hand = Hand.new( deck )
  dealer_hand = Hand.new( deck )

  gen_cookie(player_hand.cards, "player_hand_cookie")
  gen_cookie(dealer_hand.cards, "dealer_hand_cookie")
  gen_cookie(deck.cards, "deck_cookie")
  gen_cookie(deck.discards, "discard_cookie")

  erb :blackjack, locals: {  
    player_hand: player_hand, 
    dealer_hand: dealer_hand 
  }
end


post '/hit' do
  request.cookies["player_hand_cookie"]
  request.cookies["deck_cookie"]

  deck = Deck.new

  player_hand = Hand
  player_hand.hit

  erb :blackjack, locals: {  
  player_hand: player_hand, 
  dealer_hand: dealer_hand}
end


post '/stay' do
  request.cookies["dealer_hand_cookie"]

  player_hand.stay

   erb :blackjack, locals: {  
  player_hand: player_hand, 
  dealer_hand: dealer_hand}

end


