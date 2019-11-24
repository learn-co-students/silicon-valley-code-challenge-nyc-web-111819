class VentureCapitalist
    attr_reader :name, :total_worth

    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        @@all.select {|vc|
        vc.total_worth > 1000000000
        }
    end

    def offer_contract(startup, investment_type, amount_invested)
        FundingRound.new(startup, self, investment_type, amount_invested)
    end

    def funding_rounds
        FundingRound.all.select {|funding_round|
        funding_round.venture_capitalist == self
        }
    end

    def portfolio
        funding_rounds.map {|round|
        round.startup
        }.uniq
    end

    def biggest_investment
        max_investment = funding_rounds.max {|a, b|
        a.investment <=> b.investment
        }
        max_investment 
    end

    def investments_by_domain(domain)
        funding_rounds.select {|round|
        round.startup.domain == domain
        }
    end

    def invested(domain)
        total = 0
        investments_by_domain(domain).each {|round|
        total += round.investment
        }
        total
    end

end
