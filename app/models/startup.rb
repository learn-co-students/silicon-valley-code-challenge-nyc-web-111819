class Startup

    attr_reader :founder, :domain
    attr_accessor :name

    @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder 
        @domain = domain 
        self.class.all << self
    end 

    def pivot(domain, name)
        self.name = name
        @domain = domain 
    end 

    def self.find_by_founder(founder)
        self.all.find do |startup|
            startup.founder == founder 
        end 
    end 

    def self.all 
        @@all
    end 

    def self.domains 
        unique_domains = self.all.map do |startup|
            startup.domain 
        end 
        unique_domains.uniq
    end 

    def sign_contract(venture_capitalist, type, investment)
        FundingRound.new(self, venture_capitalist, type, investment)
    end 

    def funding_rounds
        FundingRound.all.select do |funding_round|
            funding_round.startup == self
        end 
    end 

    def num_funding_rounds
        funding_rounds.length
    end 

    def total_funds
        funding_rounds.reduce(0) do |total, round|
            total + round.investment
        end 
    end

    def investors
        unique_investors = funding_rounds.map do |round|
            round.venture_capitalist
        end 
        unique_investors.uniq 
    end 

    def big_investors
        investors.select do |investor|
            VentureCapitalist.tres_commas_club.include?(investor)
        end
    end 

end

