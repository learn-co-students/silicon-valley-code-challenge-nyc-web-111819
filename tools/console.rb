require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

startup1 = Startup.new("Pied Piper", "Richard", "compression")
startup2 = Startup.new("Uber", "Travis", "Ride Share")
startup3 = Startup.new("Lyft", "Mike", "Pink Share")
startup4 = Startup.new("Grubhub", "Julius", "Food Delivery")
startup5 = Startup.new("Seamless", "Scott", "Online Food")


vc1 = VentureCapitalist.new("Elon Musk", 5000000000)
vc2 = VentureCapitalist.new("Citi Bank", 80000000000)
vc3 = VentureCapitalist.new("TD Bank", 750000000)

fr1 = FundingRound.new(startup1, vc1, "Angel", -105000)
fr2 = FundingRound.new(startup1, vc2, "Seed", 400000)
fr3 = FundingRound.new(startup2, vc1, "Angel", 500000)
fr4 = FundingRound.new(startup2, vc1, "Pre-Seed", 35000)
fr5 = FundingRound.new(startup3, vc3, "Angel", 37000)
fr6 = FundingRound.new(startup3, vc2, "Series A", 235000)
fr7 = FundingRound.new(startup3, vc1, "Series B", 804800)
fr8 = FundingRound.new(startup4, vc3, "Angel", 23000)
fr9 = FundingRound.new(startup5, vc3, "Angel", 199400)






binding.pry
0 #leave this here to ensure binding.pry isn't the last line