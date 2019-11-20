require 'pry'

def initialize_deck
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
end

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

def joinor(array)
  array.map do |value|
    value.join(', a')
  end
end

def deck_values (deck)
  values = deck.map do |card|
    if card[1] == 'K' || card[1] == 'Q' || card[1] == 'J'
    card[1] = 10
    elsif card[1] == 'A'
    card[1] = 11
    else
    card[1].to_i
    end
  end
  values
end

def deck_sum (deck)
  sum = deck_values(deck).sum
  if deck_values(deck).sum > 21
    deck_values(deck).each do |value|
      if value == 11
        sum = sum - 10
      end
    end
  end
  sum
end

def bust(deck)
   deck_sum(deck) > 21
end



# method to check if busted

loop do
  new_deck = initialize_deck
  new_deck.shuffle!
  player_deck = new_deck.pop(2)
  dealer_deck = new_deck.pop(2)

  puts "Dealer has a #{joinor(deck_values(dealer_deck))} and an unknown card."
  puts "You have a #{card_values[player_deck[0][1]]} of #{card_values[player_deck[0][0]]} and a #{card_values[player_deck[1][1]]} of #{card_values[player_deck[1][0]]}. Your total is #{deck_sum(player_deck)}."

  loop do
    puts "Do you want to hit or stay?"
    answer = gets.chomp.downcase
    if answer == 'hit'
      player_deck << new_deck.pop
      puts "Your total is #{deck_sum(player_deck)}"
      puts deck_sum(player_deck)
      binding.pry
    elsif answer == 'stay'
      puts "It's the dealer's turn"
      break
    else
      puts "That is not a valid choice. Please try again!"
    end
  end
end
