class Startup
    attr_accessor :name, :funding
    attr_reader :founder, :domain
    @@all = []
    def initialize(founder, name, domain)
        @founder = founder
        @name = name
        @domain = domain
        @funding = []
        @@all << self
    end
    def pivot(domain, name)
        @domain = domain
        @name = name
    end
    def self.all
        @@all
    end
    def self.find_by_founder(founder)
        @@all.find{|startup| startup.founder == founder}
    end
    def self.domains
        @@all.map{|startup| startup.domain}
    end
    def sign_contract(venture_capitalist,investment_type, investment_amount)
        round = FundingRound.new(self, venture_capitalist, investment_type, investment_amount)
        @funding << round
    end
    def num_funding_rounds
        @funding.length
    end
    def total_funds
        (@funding.map{|round| round.investment}).reduce(:+)
    end
    def investors
        @funding.map{|round| round.venture_capitalist}.uniq
    end
    def big_investors
        listOfInvestors = @funding.map{|round| round.venture_capitalist}
        VentureCapitalist.tres_commas_club.select{|investor| listOfInvestors.include? investor}
    end
end
