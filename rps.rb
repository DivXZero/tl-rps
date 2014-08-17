
def display_banner(msg)
  puts "\n\t\t~*~*~*~>   #{msg}   <~*~*~*~\n\n"
end

def get_input(msg)
  puts "~> #{msg} :"
  return gets.chomp
end

def win
  display_banner "#{$player_choice} beats #{$computer_choice}. You Win!"
end

def lose
  display_banner "#{$computer_choice} beats #{$player_choice}. You Lose :("
end

def draw
  display_banner "You and the computer both chose #{$player_choice}. It's a draw."
end

def computer_choice?(choice)
  return $computer_choice == HANDS[choice]
end

$player_choice = nil
$computer_choice = nil
game_done = false
HANDS = {'r' => 'Rock', 'p' => 'Paper', 's' => 'Scissors'}
CONTINUE = {'y' => true, 'n' => false}

display_banner 'Let\'s Play Rock, Paper, Scissors!'

while !game_done do
  $player_choice = nil
  $player_choice = HANDS[get_input('Please make a choice [r, p, s]').downcase] until $player_choice != nil
  $computer_choice = HANDS[HANDS.keys.sample]

  case $player_choice
    when HANDS['r'] # Rock
      win if computer_choice?('s') # Wins to scissors
      lose if computer_choice?('p') # Loses to paper
    when HANDS['p'] # Paper
      win if computer_choice?('r') # Wins to rock
      lose if computer_choice?('s') # Loses to scissors
    when HANDS['s'] # Scissors
      win if computer_choice?('p') # Wins to paper
      lose if computer_choice?('r') # Loses to rock
  end

  draw if $player_choice == $computer_choice

  continue_choice = nil
  continue_choice = CONTINUE[get_input('Would you like to play again? [y, n]')] until continue_choice != nil
  game_done = !continue_choice
end