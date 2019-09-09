VALID_CHOICES = %w(rock paper scissors lizard spock)

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(first, second) #should refactor (it's too long)
  (first == 'rock' && second == 'scissors') ||
  (first == 'paper' && second == 'rock') ||
  (first == 'scissors' && second == 'paper') ||
  (first == 'rock' && second == 'lizard') ||
  (first == 'lizard' && second == 'spock') ||
  (first == 'spock' && second == 'scissors') ||
  (first == 'scissors' && second == 'lizard') ||
  (first == 'lizard' && second == 'paper') ||
  (first == 'paper' && second == 'spock') ||
  (first == 'spock' && second == 'rock')
end

def display_result(player, computer)
    if win?(player, computer)
      prompt("You won!")
    elsif win?(computer, player)
      prompt("Computer won!")
    else
      prompt("It's a tie!")
    end
  end

player_wins = 0
computer_wins = 0


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

  display_result(choice, computer_choice)

  if win?(choice, computer_choice)
    player_wins += 1
  elsif win?(computer_choice, choice)
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
