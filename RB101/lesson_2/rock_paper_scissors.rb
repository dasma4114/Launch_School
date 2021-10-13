VALID_CHOICES = ['rock', 'paper', 'scissors']

def display_results(player, computer)
  if (player == 'rock' && computer == 'scissors') ||
    (player == 'paper' && computer == 'rock') ||
    (player == 'scissors' && computer == 'paper')
    prompt('You won!')
  elsif (computer == 'rock' && player == 'scissors') ||
        (computer == 'paper' && player == 'rock') ||
        (computer == 'scissors' && player == 'paper')
    prompt('Computer won!')
  else
    prompt('It\'s a tie!')
  end
end

def prompt(message)
  puts "=> #{message}"
end

player_choice = ''

loop do
  prompt('Welcome to the game!')

  loop do
  prompt("Choose a weapon: #{VALID_CHOICES.join(', ')}.")
  player_choice = gets.chomp

    if VALID_CHOICES.include?(player_choice)
      break
    else
      prompt('That\'s not a valid choice.')
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose: #{player_choice}; Computer chose: #{computer_choice}.")

  display_results(player_choice, computer_choice)

  prompt('Would you like to play again? (y) to try again. ')
  replay = gets.chomp

  break unless replay.downcase.start_with?('y')
end

prompt('Thank you for playing! Good bye!')