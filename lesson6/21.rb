deck = [['H', '2'], ['D', '2'], ['C', '2'], ['S', '2'],
['H', '3'], ['D', '3'], ['C', '3'], ['S', '3'],
['H', '4'], ['D', '4'], ['C', '4'], ['S', '4'],
['H', '5'], ['D', '5'], ['C', '5'], ['S', '5'],
['H', '6'], ['D', '6'], ['C', '6'], ['S', '6'],
['H', '7'], ['D', '7'], ['C', '7'], ['S', '7'],
['H', '8'], ['D', '8'], ['C', '8'], ['S', '8'],
['H', '9'], ['D', '9'], ['C', '9'], ['S', '9'],
['H', '10'], ['D', '10'], ['C', '10'], ['S', '10'],
['H', 'J'], ['D', 'J'], ['C', 'J'], ['S', 'J'],
['H', 'Q'], ['D', 'Q'], ['C', 'Q'], ['S', 'Q'],
['H', 'K'], ['D', 'K'], ['C', 'K'], ['S', 'K'],
['H', 'A'], ['D', 'A'], ['C', 'A'], ['S', 'A']]

card_values = {
  'H' => 'hearts',
  'D' => 'diamonds',
  'C' => 'clubs',
  'S' => 'spades',
  'A' => 'ace',
  'K' => 'king',
  'Q' => 'queen',
  'J' => 'jack',
  '10' => 10,
  '9' => 9,
  '8' => 8,
  '7' => 7,
  '6' => 6,
  '5' => 5,
  '4' => 4,
  '3' => 3,
  '2' => 2,
}

def total_of_deck (deck)
  values = deck.map do |card|
    if card[1] == 'K' || card[1] == 'Q' || card[1] == 'J'
    card[1] = 10
    elsif card[1] == 'A'
    card[1] = 11
    else
    card[1].to_i
    end
  end
    values.sum > 21 && values.include?(11) ? values.sum - 10 : values.sum
end


# method to check if busted

loop do
  deck.shuffle!
  player_deck = deck.pop(2)
  dealer_deck = deck.pop(2)

  puts "Dealer has a #{card_values[player_deck[0][1]]} of #{card_values[dealer_deck[0][0]]} and an unknown card."
  puts "You have a #{card_values[player_deck[0][1]]} of #{card_values[player_deck[0][0]]} and a #{card_values[player_deck[1][1]]} of #{card_values[player_deck[1][0]]}."

  loop do
    puts "Do you want to hit or stay?"
    answer = gets.chomp.downcase
    if answer == 'hit'
      player_deck << deck.pop(1)
      puts "Your total is #{total_of_deck(player_deck)}"
    elsif answer == 'stay'
      puts "It's the dealer's turn"
      break
    else
      puts "That is not a valid choice. Please try again!"
    end
  end
end
