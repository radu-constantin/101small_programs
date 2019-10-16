arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]
arr.each {|subarray| subarray.select {|num| num.odd?}}.sort
