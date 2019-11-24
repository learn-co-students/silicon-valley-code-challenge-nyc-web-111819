require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

startup1 = Startup.new("Uber", "Travis Kalanick", "Transportation")
startup2 = Startup.new("Twitter", "Jack Dorsey", "Commmunication")
startup3 = Startup.new("Square", "Jack Dorsey", "Payments")
startup4 = Startup.new("AirBnb", "Brian Chesky", "Travel")

venture_capitalist1 = VentureCapitalist.new("Marc Andreessen", 1300000000)
venture_capitalist2 = VentureCapitalist.new("Ben Horowitz", 3500000000)
venture_capitalist3 = VentureCapitalist.new("Alfred Lin", 248000000)
venture_capitalist4 = VentureCapitalist.new("Tim Draper", 1000000000)

funding_round1 = FundingRound.new(startup1, venture_capitalist2, "Seed", 2_500_000.1)
funding_round2 = FundingRound.new(startup2, venture_capitalist3, "Angel", 200_000.3)
funding_round3 = FundingRound.new(startup3, venture_capitalist1, "Series A", 3_000_000.7)
funding_round4 = FundingRound.new(startup4, venture_capitalist4, "Series B", 5_000_000.5)
funding_round5 = FundingRound.new(startup1, venture_capitalist3, "Seed", 1_850_000.4)
funding_round6 = FundingRound.new(startup2, venture_capitalist1, "Angel", 275_000.6)
funding_round7 = FundingRound.new(startup4, venture_capitalist3, "Seed", 1_500_000.2)
funding_round8 = FundingRound.new(startup4, venture_capitalist4, "Seed", 1_115_000.5)



binding.pry
0 #leave this here to ensure binding.pry isn't the last line