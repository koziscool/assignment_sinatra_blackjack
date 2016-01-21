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

  def stand
    @status = 'PAT'
  end

  def check_status
  end

end