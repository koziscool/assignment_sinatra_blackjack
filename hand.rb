require_relative 'deck.rb'
require 'json'

class Hand
  
  HAND_STATUS = {'LIVE' => 'live', 'PAT' => 'pat', 'BUST' => 'bust'}

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
    check_status
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

  def check_status
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

