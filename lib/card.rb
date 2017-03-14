class Card
  attr_reader :suit, :value

  def initialize(suit, value)
    @suit = suit
    @value = value
  end

  def ace?
    if @value == "A"
      true
    else
      false
    end
  end

  def face_card?
    if @value == "J" || @value == "Q" || @value == "K"
      true
    else
      false
    end
  end
end
