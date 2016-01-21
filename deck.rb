
require 'json'

Card = Struct.new(:rank, :suit) do
  def to_s
    rank.to_s + suit.to_s
  end
end


class Deck

attr_accessor :cards, :discards

SUITS = {:C => 'c', :H => 'h', :S => 's', :D => 'd'}
RANKS = {'A' => 'a', '2' => '2', '3' => '3', '4' => '4', '5' => '5', '6' =>'6', '7' =>'7', '8' => '8', '9' => '9', 'T' => 't', 'J' => 'j', 'Q' => 'q', 'K' => 'k'}

  def initialize
    @cards = []
    @discards = []
  end

  def build_deck
    SUITS.each do |key, value|
      RANKS.each do |rank_key, rank_value|
        @cards << Card.new(rank_value, value)
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

  def to_json
    serialize_arr = [ @cards, @discards ]
    serialize_arr.to_json
  end

  def recreate_from_json( json_deck )
    json_arr = JSON.parse(json_deck)
    card_arr = json_arr[0]
    @cards = []
    card_arr.each do |card_str|     
      new_card = Card.new(card_str[0], card_str[1])
      @cards << new_card
    end

    card_arr = json_arr[1]
    @discards = []
    card_arr.each do |card_str|     
      new_card = Card.new(card_str[0], card_str[1])
      @discards << new_card
    end

  end



end



# test = Deck.new
# test.shuffle
# (0..10).each do |num|
#   print test.cards[num]
# end