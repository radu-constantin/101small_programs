arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

arr.map do |subarray|
  subarray.select do |number|
    number % 3 == 0
  end
end
