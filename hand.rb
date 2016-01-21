require_relative 'deck.rb'

class Hand
  
  HAND_STATUS = {'LIVE' => 'live', 'PAT' => 'pat', 'BUST' => 'bust'}

  attr_accessor :cards

  def initialize(deck)
    @deck = deck
    @cards = []
    @status = 'LIVE'

    @cards << deck.deal_card  
    @cards << deck.deal_card 

  end

  def hit
    @cards << @deck.deal_card
    check_status
  end

  def stay
    @status = 'PAT'
  end

  def check_status
  end

end

test = Hand.new(Deck.new)
player_hand_string = test.cards.reduce("") do |str, card| 
str + card.to_s
end
print player_hand_string