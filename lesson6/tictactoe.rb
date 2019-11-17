WHO_STARTS = 'chose'
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = '0'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[2, 5, 8], [1, 4, 7], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]

def prompt(msg)
  puts "=> #{msg}"
end

def joinor(array, joining_symbol = ", ", link = "or")
  if array.size == 1
    array.join
    elsif array.size == 0
    ""
    else
    "#{array[0..-2].join(joining_symbol)} #{link} #{array[-1]}"
  end
end

score = {
  'player' => 0,
  'computer' => 0,
}

def display_board(brd)
  system 'clear'
  puts "Your marker is #{PLAYER_MARKER}. The computer's marker is #{COMPUTER_MARKER}."
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----|-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----|-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |   #{brd[9]}"
  puts "     |     |"
  puts ""
end

def initialize_board
  new_board = {}
  (1..9).each {|num| new_board[num] = INITIAL_MARKER}
  new_board
end

def empty_squares(brd)
  brd.keys.select{|num| brd[num] == INITIAL_MARKER}
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
end
  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  if can_win?(brd)
    square = offensive_ai(brd)
  elsif detect_danger(brd)
    square = defensive_ai(brd)
  elsif brd[5] == ' '
    square = 5
  else
    square = empty_squares(brd).sample
  end
  brd[square] = COMPUTER_MARKER
end

def place_piece!(brd, current_player)
  if current_player == 'player'
    player_places_piece!(brd)
  elsif current_player == 'computer'
    computer_places_piece!(brd)
  end
end

  def alternate_player(current_player)
    if current_player == 'player'
      'computer'
    elsif current_player == 'computer'
      'player'
    end
  end

def board_full?(brd)
  empty_squares(brd) == []
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif
        brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
    nil
end

def detect_danger(brd)
  danger = false
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 2 && brd.values_at(*line).count(INITIAL_MARKER) == 1
      danger = true
    else
      nil
    end
  end
  danger
end

def can_win?(brd)
  can_win = false
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(COMPUTER_MARKER) == 2 && brd.values_at(*line).count(INITIAL_MARKER) == 1
      can_win = true
    else
      nil
    end
  end
  can_win
end

def defensive_ai(brd)
  danger_line = nil
  danger_square = nil
  WINNING_LINES.each do |line|
    danger_line = line  if brd.values_at(*line).count(PLAYER_MARKER) == 2 && brd.values_at(*line).count(INITIAL_MARKER) == 1
  end
  danger_line.each {|index| danger_square = index if brd[index] == INITIAL_MARKER}
  danger_square
end

def offensive_ai(brd)
  offensive_line = nil
  offensive_square = nil
  WINNING_LINES.each do |line|
    offensive_line = line  if brd.values_at(*line).count(COMPUTER_MARKER) == 2 && brd.values_at(*line).count(INITIAL_MARKER) == 1
  end
  offensive_line.each {|index| offensive_square = index if brd[index] == INITIAL_MARKER}
  offensive_square
end

loop do
  board = initialize_board
  display_board(board)

  prompt "Do you want to start first? (y or n)"
  answer = gets.chomp.downcase
  answer.start_with?('y')? current_player = "player" : current_player = 'computer'

  loop do
    display_board(board)
    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
  break if someone_won?(board) || board_full?(board)
end

  display_board(board)

  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"
  else
    prompt "It's a tie!"
  end

  if detect_winner(board) == "Computer"
    score['computer'] += 1
  elsif detect_winner(board) == "Player"
    score['player'] += 1
  end

  prompt "Computer won #{score['computer']} times."
  prompt "Player won #{score['player']} times."
  puts ""

  if score['computer'] == 5
    prompt "You've been beaten by a dumb computer 5 times, are you sure you want to continue? (y or n)"
  elsif score['player'] == 5
    prompt "You've won against a computer with no AI 5 times. Are you sure you want to play again? (y or n)"
  else
    prompt "Play again? (y or n)"
  end
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end



prompt "Thanks for playing Tic Tac Toe! Goodbye!"
