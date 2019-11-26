JACK = ['Jack', 10]
QUEEN = ['Queen', 10]
KING = ['King', 10]
ACE = ['Ace', 11]

TYPES = ['hearts', 'diamonds', 'clubs', 'spades']

def prompt(text)
  puts "\n=> #{text}"
end

def join_cards(array, joining_symbol = ', a ', link = 'and a')
  if array.size == 1
    array.join
  elsif array.size.zero?
    ""
  else
    "#{array[0..-2].join(joining_symbol)} #{link} #{array[-1]}"
  end
end

def initialize_deck
  new_deck = Hash.new
  TYPES.each do |type|
    for i in 2..10 do
      new_deck["#{i} of #{type}"] = i
    end
    new_deck["#{JACK[0]} of #{type}"] = JACK[1]
    new_deck["#{QUEEN[0]} of #{type}"] = QUEEN[1]
    new_deck["#{KING[0]} of #{type}"] = KING[1]
    new_deck["#{ACE[0]} of #{type}"] = ACE[1]
  end
  new_deck
end

def deal_initial_cards(deck) #deals the initial cards and also deletes them from the main deck
  initial_deck = deck.keys.sample(2)
  initial_deck.each do |card|
    deck.delete(card)
  end
  initial_deck
end

def deck_values(deck)
  deck.map {|card| initialize_deck[card]}
end

def deck_sum(deck)  # it works # it works
  values = deck_values(deck)
  sum = 0
  values.each do |value|
    sum += value
  end
  values.select { |value| value == 11 }.count.times do
  sum -= 10 if sum > 21
  end
  sum
end

def deal_card(target_deck, big_deck)
  new_card = big_deck.keys.sample
  target_deck << new_card
  big_deck.delete(new_card)
  new_card
end

def bust? (deck)
   deck_sum(deck) > 21 ? true : false
end

 def who_won? (player_deck, dealer_deck)
   if deck_sum(player_deck) > deck_sum(dealer_deck)
   'player'
   elsif deck_sum(player_deck) < deck_sum(dealer_deck)
   'dealer'
   else
   'tie'
  end
 end

 def check_5_wins(score_player, score_dealer)
   if score_player == 5
     prompt "You won 5 matches in a row. Congratulations!"
   elsif score_dealer == 5
     prompt "You lost 5 matches in a row. Please quit!"
   end
 end

 def score_announcement (score_player, score_dealer)
   prompt "The score is => Dealer: #{score_dealer}; Player #{score_player}"
 end





 player_score = 0
 dealer_score = 0

loop do #main game loop
  #initial setup

  main_deck = initialize_deck
  player_cards = deal_initial_cards(main_deck)
  dealer_cards = deal_initial_cards(main_deck)

  #present the decks
  prompt "You have a #{join_cards(player_cards)}. Your deck value is #{deck_sum(player_cards)}."
  prompt "The dealer has a #{dealer_cards[0]} and an unknown card.\n"
  #Player turn
  answer = nil
  loop do
    prompt "Hit or stay?"
    answer = gets.chomp.downcase
    if answer == 'hit'
      deal_card(player_cards, main_deck)
      prompt "You have a #{join_cards(player_cards)}."
      prompt "Your total is #{deck_sum(player_cards)}"
    end
    break if answer == 'stay' || bust?(player_cards)
  end

  if bust?(player_cards)
    prompt "You busted. The dealer won!"
    dealer_score += 1
    score_announcement(player_score, dealer_score)
    check_5_wins(player_score, dealer_score)
    break
  else
    puts "You chose to stay! Your total is #{deck_sum(player_cards)}."
  end

  loop do
    break if deck_sum(dealer_cards) >= 17 || bust?(dealer_cards)
    if deck_sum(dealer_cards) < 17
      deal_card(dealer_cards, main_deck)
      prompt "The dealer hit."
    end
  end

  if bust?(dealer_cards)
    prompt "The dealer busted. You win!"
    player_score += 1
    score_announcement(player_score, dealer_score)
    check_5_wins(player_score, dealer_score)
    break
  else
    puts "The dealer chose to stay!"
  end

  prompt "The dealer has a #{join_cards(dealer_cards)}, for a total of #{deck_sum(dealer_cards)}."
  prompt "You have a #{join_cards(player_cards)}, for a total of #{deck_sum(player_cards)}."
  if who_won?(player_cards, dealer_cards) == 'player'
    prompt "You won!"
    player_score += 1
  elsif who_won?(player_cards, dealer_cards) == 'dealer'
    prompt "The dealer won!"
    dealer_score += 1
  else
    prompt "It's a tie."
  end

  score_announcement(player_score, dealer_score)

  check_5_wins(player_score, dealer_score)

  prompt 'Do you want to play again?(y or n)'
  choice = gets.chomp.downcase
  break unless choice.start_with?('y')
end
