number = 0

loop do
puts "Please enter a number greater than 0."
number = gets.chomp.to_i
break if number > 0
puts "The number you entered isn't greater than 0. Try again!"
end

puts "What operation would you like to do? ('s' for sum and 'p' for product)."
answer = gets.chomp

case answer
when 's'
  result = (1..number).to_a.sum
  puts "The sum of the integers between 1 and #{number} is #{result}."
when 'p'
  result = 1
  (1..number).to_a.each {|num| result *= num}
  puts "The product of the integers between 1 and #{number} is #{result}."
  end
