require_relative "card"
require_relative "deck"
require_relative "hand"
require "pry"

deck = Deck.new
deck.shuffle!

player = Hand.new([])
dealer = Hand.new([])

2.times do
  player.add_card!(deck.draw!)
  dealer.add_card!(deck.draw!)
end
puts "welcome to Blackjack"
puts "player cards: #{player.to_s}"
puts "dealer cards: #{dealer.to_s}"
puts "Player's score: #{player.value}"

input = "h"
while input == "h" && player.value <= 21
  if player.value == 21
    break
  end
  puts "would you like to hit or stand (h/s)?"
  input = gets.chomp.downcase
  if input == "h"
    player.add_card!(deck.draw!)
    puts "you now have #{player.to_s}"
    puts player.value
  elsif input == "s"
    puts player.value
  else
    puts "you put in a wrong input"
    input = "h"
  end
end

puts dealer.value

while dealer.value < 17 
  if player.value > 21
    break
  else
    dealer.add_card!(deck.draw!)
    puts "dealer now has #{dealer.to_s}"
    puts dealer.value
  end
end

if player.value > 21
  puts "bust, you lost"
elsif dealer.value > 21
  puts "you win!"
elsif dealer.value > player.value
  puts "Sorry! Dealer Wins!"
elsif dealer.value < player.value
  puts "Congrats! You won!"
else
  puts "you tied!"
end
