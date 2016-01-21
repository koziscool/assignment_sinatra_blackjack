
Card = Struct.new(:suit, :rank) do
  def to_s
    rank.to_s + suit.to_s + " "
  end
end


class Deck

attr_accessor :cards, :discards

SUITS = {:C => 'c', :H => 'h', :S => 's', :D => 'd'}
RANKS = {'A' => 'a', '2' => '2', '3' => '3', '4' => '4', '5' => '5', '6' =>'6', '7' =>'7', '8' => '8', '9' => '9', 'T' => 't', 'J' => 'j', 'Q' => 'q', 'K' => 'k'}

  def initialize
    @cards = []
    @discards = []
    SUITS.each do |key, value|
      RANKS.each do |rank_key, rank_value|
        @cards << Card.new(value, rank_value)
      end
    end
  end

  def shuffle
    @cards.shuffle!
  end

  def deal_card
    new_card = @cards.pop
    @discards << new_card
    new_card
  end

end



# test = Deck.new
# test.shuffle
# (0..10).each do |num|
#   print test.cards[num]
# end