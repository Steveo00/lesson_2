require 'yaml'
MESSAGES = YAML.load_file('mortgage_messages.yml')

def prompt(message)
  puts "=> #{message}"
end

def float?(num)
  num.to_f.to_s == num
end

def integer?(num)
  num.to_i.to_s == num
end

def number?(num)
  float?(num) || integer?(num)
end

prompt(MESSAGES['welcome'])
puts

loop do
  loan_amount = ''
  loop do
    prompt(MESSAGES['loan_amount'])
    loan_amount = gets.chomp
    if number?(loan_amount) && loan_amount.to_i > 0
      break
    else
      prompt(MESSAGES['loan_amount_validate'])
    end
  end

  annual_interest_rate = ''
  loop do
    prompt(MESSAGES['interest_rate'])
    annual_interest_rate = gets.chomp
    if number?(annual_interest_rate) && annual_interest_rate.to_i > 0
      break
    else
      prompt(MESSAGES['interest_rate_validate'])
    end
  end

  monthly_interest_rate = annual_interest_rate.to_f / 100 / 12

  loan_term_years = ''
  loop do
    prompt(MESSAGES['loan_term'])
    loan_term_years = gets.chomp
    if integer?(loan_term_years) && loan_term_years.to_i > 0
      break
    else
      prompt(MESSAGES['loan_term_validate'])
    end
  end

  loan_term_months = loan_term_years.to_i * 12

  monthly_payment = loan_amount.to_f * (monthly_interest_rate /
                    (1 - (1 + monthly_interest_rate)**-loan_term_months))

  prompt("Your monthly payment is: $#{format('%02.2f', monthly_payment)}")

  prompt(MESSAGES['another_calculation'])
  repeat = gets.chomp.downcase
  break if repeat != 'y'
end

prompt(MESSAGES['farewell'])
