arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]
new_arr = arr.each do |subarray|
  subarray.sort! {|a, b| b <=> a}
end

puts new_arr
