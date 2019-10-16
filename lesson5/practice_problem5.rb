munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

total_age = 0
counter = 0

loop do
  members = munsters.keys
  if munsters[members[counter]]["gender"] == "male"
    total_age += munsters[members[counter]]["age"]
  end
  counter += 1
  break if counter == members.size
end

puts total_age
