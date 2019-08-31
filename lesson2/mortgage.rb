def text (string)
  puts "=>" + string
end

def valid_num? (number)
  number.to_i > 0 || number.to_f.to_s == number
end

def valid_period? (number)
  number.to_i.to_s == number && number.to_i > 0
end

text("Welcome to the Mortgage calculator!")

text("In order to proceed I will need some information")

loop do #main program loop

loan_amount = ''
loop do
text("What is the amount loaned?")
  loan_amount = gets.chomp
  if valid_num?(loan_amount)
    break
  else
    text("That is not a valid loan amount. Please try again!")
  end
end

apr = ''
loop do
text("What is the Anual Percentage Rate (APR)?")
  apr = gets.chomp
  if valid_num?(apr)
    break
  else
    text("That is not a valid Anual Percentage Rate. Please try again!")
  end
end

dur_year = ''
loop do
text("For how many years is the loan?")
  dur_year = gets.chomp
  if valid_period?(dur_year)
    break
  else
    text("That is not a valid duration.Please try again!")
end
end

dur_months = dur_year.to_i * 12
apr = apr.to_f / 100
mpr = apr / 12

result = loan_amount.to_f * (mpr/(1 - (1 + mpr)**(-dur_months)))
result = result.round(4)

text("Your monthly payment is #{result}.")

text("Do you want to make another calculation? ('Y'to calculate again)")
answer = gets.chomp.downcase
if answer != "y"
  text ("Thank you for using this program.")
  break
end
end
