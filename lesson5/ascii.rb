def ascii_value(string)
  ascii_value_array = []
  string.each_char do |char|
    ascii_value_array << char.ord
  end
  ascii_value_array.sum
end
