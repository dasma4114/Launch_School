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

# main loop
system 'clear'

prompt(WELCOME_MESSAGE)
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