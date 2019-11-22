require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

startup1 = Startup.new("Richard Hendrix", "Pied Piper","Music Database")
startup2 = Startup.new("Elon Musk", "Tesla", "Cars")
startup3 = Startup.new("jeff", "Wide Wiper", "Music Database")
vc1 = VentureCapitalist.new("Mark Gates", 150000)
vc2 = VentureCapitalist.new("Tony", 15000000)
vc3 = VentureCapitalist.new("Shakil", 15)
fund1 = FundingRound.new(startup1, vc1, "Angel",15000)
fund2 = FundingRound.new(startup2, vc2, "Angel",15000)
fund3 = FundingRound.new(startup3, vc1, "Angel",15000)


binding.pry
0 #leave this here to ensure binding.pry isn't the last line