munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |key, value|
  if value["age"] < 20
    value["age_group"] = "teenager"
  elsif value["age"] > 20 && value["age"] < 100
    value["age_group"] = "adult"
  else
    value["age_group"] = "old"
end

end

puts munsters
