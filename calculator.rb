# ask the user for two numbers
# ask the user for the operation to perform
# perform the operation on the two numbers
# display the result

puts "Welcome to the Calculator"

puts "Please enter your first number"
number1 = gets.chomp
puts "Please enter your second_number"
number2 = gets.chomp
puts "What operation would you like to perform."
puts "Please enter 1) to add, 2) to subtract, 3) to multiply and 4) to divide"
operation = gets.chomp

if operation == '1'
  then puts "The answer is #{number1.to_i + number2.to_i}"
elsif operation == '2'
  then puts "The answer is #{number1.to_i - number2.to_i}"
elsif operation == '3'
  then puts "The answer is #{number1.to_i * number2.to_i}"
else
       puts "The answer is #{number1.to_f / number2.to_f}"
end
