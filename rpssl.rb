VALID_CHOICES = %w(rock paper scissors spock lizard)

WINNING_COMBINATIONS = { 'rock' => ['lizard', 'scissors'],
                         'paper' => ['rock', 'spock'],
                         'scissors' => ['paper', 'lizard'],
                         'lizard' => ['paper', 'spock'],
                         'spock' => ['rock', 'scissors'] }

def prompt(message)
  puts("=> #{message}")
end

def win?(first, second)
  WINNING_COMBINATIONS.key?(first) &&
    WINNING_COMBINATIONS[first].include?(second)
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

loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets.chomp
    if VALID_CHOICES.include?(choice)
      break
    else
      puts "That is not a valid choice."
    end
  end

  computer_choice = VALID_CHOICES.sample

  puts "You chose: #{choice}. The computer chose: #{computer_choice}"

  display_results(choice, computer_choice)

  puts "Do you want to play again?"
  answer = gets.chomp.downcase
  break unless answer.start_with?('y')
end

puts "Thank you for playing. Goodbye!"
