VALID_CHOICES = ['rock', 'paper', 'scissors']

def determine_winner(choice1, choice2)
  (choice1 == 'rock' && choice2 == 'scissors') ||
    (choice1 == 'paper' && choice2 == 'rock') ||
    (choice1 == 'scissors' && choice2 == 'paper')
end

def prompt(message)
  puts "=> #{message}"
end

player_choice = ''

loop do
  system 'clear'
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

  if determine_winner(player_choice, computer_choice)
    puts "You won!"
  elsif determine_winner(computer_choice, player_choice)
    puts "Computer won!"
  else
    puts "It's a tie!"
  end

  prompt('Would you like to play again? (y) to try again. ')
  replay = gets.chomp

  break unless replay.downcase.start_with?('y')
end

prompt('Thank you for playing! Good bye!')
