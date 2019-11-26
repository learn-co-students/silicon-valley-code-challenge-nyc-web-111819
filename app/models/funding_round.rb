class FundingRound
	attr_accessor :investment
	attr_reader :startup, :type, :venture_capitalist

	@@all = []

	def initialize(startup, type, venture_capitalist, investment)
		investment.positive? ? @investment = investment.to_f : positive_number_only_please
		# @investment = investment.abs.to_f
		@venture_capitalist = venture_capitalist
		@type = type
		@startup = startup
		self.class.all << self
	end

	def self.all
		@@all
	end
end
