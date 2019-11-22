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





binding.pry
0 #leave this here to ensure binding.pry isn't the last line