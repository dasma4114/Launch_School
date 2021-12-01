VALID_CHOICES = {
  'rock' => { shortcut: 'r', beats: ['scissors', 'lizard'] },
  'paper' => { shortcut: 'p', beats: ['rock', 'spock'] },
  'scissors' => { shortcut: 's', beats: ['paper', 'lizard'] },
  'lizard' => { shortcut: 'l', beats: ['spock', 'paper'] },
  'spock' => { shortcut: 'sp', beats: ['rock', 'scissors'] }
}

VALID_YES_NO = ['yes', 'no', 'y', 'n']

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

WIN_SCORE = 3

# initializing variables
computer_choice = ''
player_score = 0
computer_score = 0

# show arrow on outputs
def prompt(message)
  puts "=> #{message}"
end

def choose_move()
  choice = ''
  player_choice = ''
  loop do
    choice = gets.chomp
    player_choice = convert_choice(choice)
    if valid_move?(player_choice)
      break
    else
      prompt("Invalid choice, please try again.")
    end
  end
  player_choice
end

# check if input is valid
def valid_move?(input)
  VALID_CHOICES.include?(input)
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

def beats?(choice1, choice2)
  VALID_CHOICES[choice1][:beats].include?(choice2)
end

def winner?(score)
  true if score == WIN_SCORE
end

# main loop
system 'clear'

prompt(WELCOME_MESSAGE)
loop do
  loop do
    prompt(INSTRUCTIONS)
    player_choice = choose_move
    computer_choice = VALID_CHOICES.keys.sample

    system 'clear'

    prompt("Player chosen #{player_choice}; Computer chose #{computer_choice}.")

    if beats?(player_choice, computer_choice)
      prompt("You won the previous round!")
      player_score += 1
    elsif beats?(computer_choice, player_choice)
      prompt("Computer won the previous round!")
      computer_score += 1
    else
      prompt("It's a tie! No points awarded.")
    end

    prompt("Player = #{player_score}; Computer = #{computer_score}.")

    if winner?(player_score)
      prompt('Congratulations! You won the game!')
      break
    elsif winner?(computer_score)
      prompt('The computer won! Better luck next time!')
      break
    end
  end

  # check if player wants to replay
  prompt('Would you like to play again?')
  replay = gets.chomp
  if VALID_YES_NO.include?(replay)
    break
  else
    prompt('Please enter a valid choice.')
  end
  break unless replay == 'yes'
end
