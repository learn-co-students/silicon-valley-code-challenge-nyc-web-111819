class Startup
    attr_reader :founder
    attr_accessor :name, :domain

    @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    def self.all
        @@all
    end

    def self.find_by_founder(founder_name)
        @@all.find {|startup|
        startup.founder == founder_name
        }
    end

    def self.domains
        @@all.map {|startup|
        startup.domain
        }
    end

    def pivot(domain, name)
        @domain = domain
        @name = name
    end

    def sign_contract(vc_object, investment_type, amount_invested)
        FundingRound.new(self, vc_object, investment_type, amount_invested)
    end

    def funding_rounds
        FundingRound.all.select {|funding_round|
        funding_round.startup == self
        }.uniq
    end

    def num_funding_rounds
        funding_rounds.length
    end

    def total_funds
        total = 0
        funding_rounds.each {|round|
        total += round.investment
        }
        total
    end

    def investors
        funding_rounds.map {|funding_round|
        funding_round.venture_capitalist
        }.uniq
    end

    def big_investors
        investors.select {|investor|
        investor.total_worth > 1000000000
        }.uniq
    end

end
