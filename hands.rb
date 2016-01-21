require_relative 'deck'


class Hand
  
  HAND_STATUS = {'LIVE' => 'live', 'PAT' => 'pat', 'BUST' => 'bust'}

  def initialize(deck)
    @deck = deck
    @cards = []
    @status = 'LIVE'

    @cards<< deck.deal_card  
    @cards<< deck.deal_card 

  end

  def hit
    @cards << @deck.deal_card
    check_status
  end

  def stand
    @satus = 'PAT'
  end

  def check_status
  end

  

end