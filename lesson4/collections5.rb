flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.index do |name|
  name[0] == "B" && name[1] == "a"
end
