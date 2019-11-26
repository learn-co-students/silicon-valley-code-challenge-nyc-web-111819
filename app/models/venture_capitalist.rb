class VentureCapitalist
	attr_accessor :name, :total_worth
	attr_reader

	@@all = []

	def initialize(name, total_worth)
		@name = name
		@total_worth = total_worth.to_f
		self.class.all << self
	end

	def self.all
		@@all
	end

	def self.tres_commas_club
		self.all.select do |vc|
			vc.total_worth >= 1000000000
		end
	end

	def offer_contract(startup, type, investment)
		FundingRound.new(startup, type, self, investment)
	end

	def funding_rounds
		FundingRound.all.select do |funding_round|
			funding_round.venture_capitalist == self 
		end
	end

	def portfolio
		s = funding_rounds.map do |funding_round|
			funding_round.startup
		end
		s.uniq
	end

	def biggest_investment
		funding_rounds.max_by do |funding_round|
			funding_round.investment
		end
	end

	def invested(domain)
		d = funding_rounds.select do |funding_round|
			funding_round.startup.domain == domain 
		end
		total = 0
		d.each do |funding_round|
			total += funding_round.investment
		end
		total 
	end
end
