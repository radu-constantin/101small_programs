hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

VOWELS = ["a", "e", "i", "o", "u"]
result = []

hsh.each do |key, value|
  value.each do |word|
    word.chars do |char|
      result << char if VOWELS.include?(char)
    end
  end
end

  print result
