require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

startup1 = Startup.new("Chompr", "James", "Dentisry")
startup2 = Startup.new("Swampd", "Alex", "Ecology")
startup3 = Startup.new("Clippt", "Zalmi", "Paperclips")
startup4 = Startup.new("Sweet Bagels", "Shakil", "Donuts")

venture_capitalist1 = VentureCapitalist.new("Hermione", 1500000000)
venture_capitalist2 = VentureCapitalist.new("Harry", 700000000)
venture_capitalist3 = VentureCapitalist.new("Ron", 900000000)
venture_capitalist4 = VentureCapitalist.new("Cedric", 1500000000)

funding_round1 = FundingRound.new(startup1, venture_capitalist1, "Angel", 200000)
funding_round2 = FundingRound.new(startup1, venture_capitalist2, "Angel", 100000)
funding_round3 = FundingRound.new(startup1, venture_capitalist3, "Angel", 300000)
funding_round4 = FundingRound.new(startup2, venture_capitalist1, "Angel", 300000)
funding_round5 = FundingRound.new(startup2, venture_capitalist2, "Angel", 150000)
funding_round6 = FundingRound.new(startup2, venture_capitalist4, "Angel", 210000)
funding_round7 = FundingRound.new(startup3, venture_capitalist4, "Angel", 100000)
funding_round8 = FundingRound.new(startup4, venture_capitalist3, "Angel", 120000)
funding_round9 = FundingRound.new(startup4, venture_capitalist4, "Angel", 110000)
funding_round10 = FundingRound.new(startup1, venture_capitalist1, "Pre-seed", 200000)
funding_round11 = FundingRound.new(startup1, venture_capitalist2, "Pre-seed", -100000)




binding.pry
0 #leave this here to ensure binding.pry isn't the last line