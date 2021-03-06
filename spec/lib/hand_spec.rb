require "spec_helper"

RSpec.describe 'Hand' do
  let!(:ace1) { Card.new(:spade, "A") }
  let!(:ace2) { Card.new(:heart, "A") }
  let!(:jack1) { Card.new(:spade, "J") }
  let!(:jack2) { Card.new(:heart, "J") }
  let!(:four) { Card.new(:spade, "4") }
  let!(:seven) { Card.new(:club, "7") }

  describe "#cards" do
    let(:hand) { Hand.new([ace1, jack1]) }

    it "returns the cards in the hand" do
      expect(hand.cards).to contain_exactly(ace1, jack1) #matches array elements disregarding order
    end
  end

  describe "#value" do
    describe "for an empty hand" do
      let(:hand) { Hand.new([]) }

      it "returns 0" do
        expect(hand.value).to eq(0)
      end
    end

    describe "for a hand with no face cards or aces" do
      let(:hand) { Hand.new([seven, four]) }

      it "returns the value of the hand" do
        expect(hand.value).to eq(11)
      end
    end

    describe "for a hand with multiple face cards" do
      let(:hand) { Hand.new([jack1, jack2]) }

      it "returns the value of the hand" do
        expect(hand.value).to eq(20)
      end
    end

    describe "for a hand with multiple aces" do
      let(:hand) { Hand.new([ace1, ace2, seven]) }

      it "returns the value of the hand" do
        expect(hand.value).to eq(19)
      end
    end
  end

  describe "#to_s" do
    let(:hand) { Hand.new([ace1, jack1, seven]) }
    it "returns a string representation of the hand" do
      expect(hand.to_s).to eq("A, J, 7")
    end
  end

  describe "add_card!" do
    let(:hand) { Hand.new([ace1, jack1, seven]) }

    it "adds a card to the hand" do
      hand.add_card!(ace2)
      expect(hand.cards).to include(ace2)
    end
  end
end
