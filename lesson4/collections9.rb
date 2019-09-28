words = "the flintstones rock"
word_array = words.split(" ").map do |word|
  word.capitalize
end

puts word_array.join(" ")
