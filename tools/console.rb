require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

artsy = Startup.new("Artsy", "Carter Cleveland", "art")
fartsy = Startup.new("Fartsy", "Carter Cleveland", "art")
wendi = VentureCapitalist.new("Wendi", 100000)
bob = VentureCapitalist.new("Bob", 200000000000)
artsy_series_a = FundingRound.new(artsy, bob, "series A", 10000000)
artsy_series_b = FundingRound.new(artsy, wendi, "series B", 40000000)
artsy_series_c = FundingRound.new(artsy, bob, "series C", 900)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line