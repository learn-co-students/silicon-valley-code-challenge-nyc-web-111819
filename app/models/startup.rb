require 'pry'
class Startup
	attr_accessor :name
	attr_reader :founder, :domain

	@@all = []

	def initialize(name, founder, domain)
		@name = name
		@founder = founder
		@domain = domain
		self.class.all << self
	end

	def self.all
		@@all
	end

	def pivot(name, domain)
		self.name = name 
		self.domain = domain
	end

	def self.find_by_founder(name)
		self.all.find do |startup|
			startup.founder == name 
		end
	end

	def self.domains
		self.all.map do |startup|
			startup.domain
		end
	end
	
	def sign_contract(vc, type, investment)
		FundingRound.new(self, type, vc, investment)
	end

	def num_funding_rounds
		FundingRound.all.select do |funding_round|
			funding_round.startup == self 
		end
	end

	def total_funds
		total = 0.0
		num_funding_rounds.each do |funding_round|
			total += funding_round.investment
		end
		total
	end

	def investors
		i = num_funding_rounds.map do |funding_round|
			funding_round.venture_capitalist
		end
		i.uniq
	end

	def big_investors
		# if investers and they are in the 3 comma club
		# they get put into an array
		investors.select do |invester|
			VentureCapitalist.tres_commas_club.any?(invester)
		end
	end

	private

	def domain=(domain)
		@domain = domain
	end

end
