VALID_CHOICES = %w(rock paper scissors spock lizard r p s l)

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
  player_score = 0
  computer_score = 0

  while player_score < 5 && computer_score < 5
    choice = ''
    loop do
      prompt("Choose one: #{VALID_CHOICES.join(', ')}")
      choice = gets.chomp
      if VALID_CHOICES.include?(choice)
        choice = 'rock' if choice == 'r'
        choice = 'paper' if choice == 'p'
        choice = 'lizard' if choice == 'l'
        if choice == 's'
          prompt("I'm not sure whether you mean scissors or spock.")
          prompt('Please type in full.')
          choice = gets.chomp
          loop do
            if choice != ('spock' || 'scissors')
              prompt('Did you mean spock or scissors?')
              choice = gets.chomp
            end
            break
          end
        end
        break
      else
        puts "That is not a valid choice."
      end
    end

    computer_choice = %w(rock paper scissors spock lizard).sample

    puts "You chose: #{choice}. The computer chose: #{computer_choice}"

    display_results(choice, computer_choice)

    if win?(choice, computer_choice)
      player_score += 1
    end
    if win?(computer_choice, choice)
      computer_score += 1
    end
    puts "The player score is #{player_score}."
    puts "The computer score is #{computer_score}."
  end

  if player_score == 5
    puts "Player is the Grand Winner."
  else
    puts "Computer is the Grand Winner."
  end

  puts "Would you like to play again? (y/n)"
  play_again = gets.chomp.downcase
  break if play_again != 'y'
end

puts "Thank you for playing. Goodbye!"
