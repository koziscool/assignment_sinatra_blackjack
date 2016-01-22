require_relative 'deck.rb'
require 'json'

class Hand
  
  CARD_VALUE ={'a' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' =>6, '7' =>7, '8' => 8, '9' => 9, 't' => 10, 'j' => 10, 'q' => 10, 'k' => 10}

  VALUE = []

  attr_accessor :cards, :status

  def initialize
    @cards = []
    @status = 'LIVE'
  end

  def starting_hand (deck)
    @cards << deck.deal_card  
    @cards << deck.deal_card 
  end

  def hit(deck)
    @cards << deck.deal_card
    update_status
  end

  def stay
    @status = 'PAT'
  end

  def recreate_from_json( json_hand )
    json_arr = JSON.parse(json_hand)
    @status = json_arr[1]
    card_arr = json_arr[0]
    @cards = []
    card_arr.each do |card_str|     
      new_card = Card.new(card_str[0], card_str[1])
      @cards << new_card
    end
  end

  def to_json
    serialize_arr = [ @cards, @status ]
    serialize_arr.to_json
  end

  def hand_value
    @cards.reduce(0) do |sum, card|
        sum + CARD_VALUE[card.rank]
    end
  end

  def update_status
    if hand_value > 21
      status = 'BUST'
    end
  end

end

# test = Hand.new
# deck = Deck.new
# deck.build_deck

# test.starting_hand( deck )
# player_hand_info = [ test.cards, test.status ]
# t = player_hand_info.to_json
# print t

# puts
# print JSON.parse( t )

