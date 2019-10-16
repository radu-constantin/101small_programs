#Given this data structure write some code to return an array containing the colors
#of the fruits and the sizes of the vegetables. The sizes should be uppercase and the colors should be capitalized.

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

#[["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]


array = []
hsh.each do |key, value|
  if value[:type] == "fruit"
  value[:colors] = value[:colors].map {|word| word.capitalize}
    array << value[:colors]
  else
    array << value[:size].upcase
  end
end

puts array
