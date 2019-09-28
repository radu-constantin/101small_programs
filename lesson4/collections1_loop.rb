flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
hash = {}
counter = 0

loop do
  hash[flintstones[counter]] = flintstones.index(flintstones[counter])
  counter += 1
  break if counter == flintstones.size
end

puts hash
