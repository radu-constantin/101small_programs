arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
hash = {}

arr.each do |subarray|
  hash[subarray[0]] = subarray[1]
end

puts hash
