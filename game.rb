
require 'json'

class Game

  attr_accessor :deck, :dealer_hand, :player_hand

  def initialize
    @dealer_hand = Hand.new
    @player_hand = Hand.new
    @deck = Deck.new
  end

  def to_json
    serialize_arr = [  @deck.to_json, @dealer_hand.to_json, @player_hand.to_json ]
    serialize_arr.to_json
  end

  def recreate_from_json( json_game  )
    json_arr = JSON.parse( json_game  )

    @deck.recreate_from_json( json_arr[0] )
    @dealer_hand.recreate_from_json( json_arr[1] )
    @player_hand.recreate_from_json( json_arr[2] )
    self
  end

  def evaluate_winner
    return "Dealer Wins" if @player_hand.status == "BUST"
  end

end



