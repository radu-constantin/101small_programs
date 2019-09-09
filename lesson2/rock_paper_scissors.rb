VALID_CHOICES = %w(rock paper scissors lizard spock)

def prompt(message)
  Kernel.puts("=> #{message}")
end

computer_wins = 0
player_wins = 0

  possible_wins = {
    'rock' => ['scissors', 'lizard'],
    'paper' => ['rock', 'spock'],
    'scissors' => ['paper', 'lizard'],
    'lizard' => ['spock', 'paper'],
    'spock' => ['scissors', 'rock']
  }

loop do
  choice = ''
  loop do
    prompt("Type - 'r' for rock, 'p' for paper, 's' for scissors, 'l' for lizzard and 'S' for spock.")
    choice = Kernel.gets().chomp()

    case choice
    when 'r'
      choice = 'rock'
    when 'p'
      choice = 'paper'
    when 's'
      choice = 'scissors'
    when 'l'
      choice = 'lizzard'
    when 'S'
      choice = 'spock'
    end

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That is not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose: #{choice}; Computer chose: #{computer_choice}")

  if possible_wins[choice].include?(computer_choice)
    prompt("You won!")
    player_wins += 1
  elsif
    choice == computer_choice
    prompt("It's a tie!")
  else
    prompt("Computer won")
    computer_wins += 1
  end

  if computer_wins == 5
    prompt "Computer is the grand winner!"
  elsif player_wins == 5
    prompt "Player is the grand winner!"
  end

  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()


  break unless answer.downcase().start_with?('y')
end


prompt("Thank you for playing!")
