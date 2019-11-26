require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
vc1 = VentureCapitalist.new("Dumbledore", 5000000000)
vc2 = VentureCapitalist.new("Harry", 3500000000)
vc3 = VentureCapitalist.new("Molly", 10000)
vc4 = VentureCapitalist.new("Hagrid", 2000)

s1 = Startup.new("Weasleys Wizard Wheezes", "Fred & George", "Wizard-Wheezes.com")
s2 = Startup.new("Homegrown Crackery", "Gilderoy Lockheart", "Crakpot.com")
s3 = Startup.new("Pet Dragon", "Charlie Weasley", "Dragon-Pet.com")
s4 = Startup.new("Arcane Knitting Patterns", "Bigitty Dort", "Arcane-Knit.com")

fr1 = FundingRound.new(s1, "Angel", vc2, 1000)
binding.pry
0 #leave this here to ensure binding.pry isn't the last line