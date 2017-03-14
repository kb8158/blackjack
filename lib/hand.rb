class Hand
  attr_reader :cards
  def initialize(cards)
    @cards = cards
    @value = value
  end

  def value
  value = 0
  @cards.each do |card|
    if card.face_card?
      value += 10
    elsif !card.ace?
      value += card.value.to_i
    end
  end
  @cards.each do |card|
    if card.ace? && value < 11
      value +=11
    elsif card.ace? && value >=11
      value +=1
    end
  end
  value
 end

 def to_s
   print_string  = ""
   @cards.each do |card|
    if card == @cards[-1]
     print_string += "#{card.value}"
    else
     print_string += "#{card.value}, "
   end
  end
   print_string
 end

 def add_card!(card)
   @cards << card
 end
end
