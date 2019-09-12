def factors(number)
  divisor = number
  factors = []
  loop do
  if number % divisor == 0
    factors << number / divisor
    divisor -= 1
  elsif number == 0
    puts "Numbers are not divisible by 0."
  elsif number < 0
    puts "Numbers are not supposed to be negative. Type a positive number."
  elsif divisor == 0
    break
  end
end
  factors
end

puts factors(6)
