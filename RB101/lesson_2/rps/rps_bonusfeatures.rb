VALID_CHOICES = {
  'rock' => { shortcut: 'r', beats: ['scissors', 'lizard'] },
  'paper' => { shortcut: 'p', beats: ['rock', 'spock'] },
  'scissors' => { shortcut: 's', beats: ['paper', 'lizard'] },
  'lizard' => { shortcut: 'l', beats: ['spock', 'paper'] },
  'spock' => { shortcut: 'sp', beats: ['rock', 'scissors'] }
}

WELCOME_MESSAGE = <<~MSG
  Welcome to rock, paper, scissors, lizard, spock!
  => Remember:
  => rock beats scissors and lizard
  => paper beats rock and spock
  => scissors beats paper and lizard
  => lizard beats spock and paper
  => spock beats rock and scissors
  => First one to win 3 rounds wins the game. Goodluck!
MSG

INSTRUCTIONS = <<~MSG
  Choose your weapon!
  => Enter 'r' for rock.
  => Enter 'p' for paper.
  => Enter 's' for scissors.
  => Enter 'l' for lizard.
  => Enter 'sp' for spock.
MSG

# initializing variables
choice = ''
player_choice = ''
computer_choice = ''
player_score = 0
computer_score = 0

# show arrow on outputs
def prompt(message)
  puts "=> #{message}"
end

# check if input is valid
def validate_input(input)
  true if VALID_CHOICES.include?(input)
end

# convert user input to keys of the VALID_CHOICES hash
def convert_choice(letter)
  case letter
  when 'r' then 'rock'
  when 'p' then 'paper'
  when 's' then 'scissors'
  when 'l' then 'lizard'
  when 'sp' then 'spock'
  end
end

def determine_winner(choice1, choice2)
  true if VALID_CHOICES[choice1][:beats].include?(choice2)
end

# main loop
system 'clear'

prompt(WELCOME_MESSAGE)
loop do
  loop do
    prompt(INSTRUCTIONS)
    choice = gets.chomp
    player_choice = convert_choice(choice)
      if validate_input(player_choice)
        break
      else
        prompt("Invalid choice, please try again.")
      end
  end

  computer_choice = VALID_CHOICES.keys.sample

  prompt("Player chosen #{player_choice}; Computer chose #{computer_choice}.")

  if determine_winner(player_choice, computer_choice)
    prompt("You won this round!")
    player_score += 1
  elsif determine_winner(computer_choice, player_choice)
    prompt("Computer won this round!")
    computer_score += 1
  else
    prompt("It's a tie! No points awarded.")
  end
end
