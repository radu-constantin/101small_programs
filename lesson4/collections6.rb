flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

short = flintstones.map do |name|
  name = name[0..2]
end

 puts short
