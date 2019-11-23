JACK = ['Jack', 10]
QUEEN = ['Queen', 10]
KING = ['King', 10]
ACE = ['Ace', 11]

TYPES = ['hearts', 'diamonds', 'clubs', 'spades']

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

def deal_initial_cards(deck)   #deals the initial cards and also deletes them from the main deck
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


  main_deck = initialize_deck
  player_cards = deal_initial_cards(main_deck)
  dealer_cards = deal_initial_cards(main_deck)


  puts "You have a #{player_cards.join(" and a ")}."
  puts "The dealer has a #{dealer_cards.join(" and a ")}"
  puts deck_values(player_cards)
  puts deck_sum(player_cards)
  puts bust? (player_cards)
  puts main_deck.count
  deal_card(player_cards, main_deck)
  puts player_cards
  puts deck_sum(player_cards)
  puts bust?(player_cards)
  puts main_deck.count
