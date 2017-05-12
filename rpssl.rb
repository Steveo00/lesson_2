VALID_CHOICES = %w(rock paper scissors spock lizard)

WINNING_COMBINATIONS = { rock: ['lizard', 'scissors'],
                         paper: ['rock', 'spock'],
                         scissors: ['paper', 'lizard'],
                         lizard: ['paper', 'spock'],
                         spock: ['rock', 'scissors'] }

def prompt(message)
  puts("=> #{message}")
end

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'scissors' && second == 'paper')
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie")
  end
end
