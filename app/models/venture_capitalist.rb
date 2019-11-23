class VentureCapitalist
    attr_accessor :name, :total_worth

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
        # returns an array of all venture capitalists in the Trés Commas club (they have more then 1,000,000,000 total_worth)
        all.select {|v_c| v_c.total_worth >= 1000000000.00}
    end

    def offer_contract(startup, type, investment)
        # given a startup object, type of investment (as a string), and the amount invested (as a float), 
        # creates a new funding round and associates it with that startup and venture capitalist.
        FundingRound.new(startup, self, type, investment)

    end

    def funding_rounds
        # returns an array of all funding rounds for that venture capitalist
        FundingRound.all.select{|fundings| fundings.venture_capitalist == self}

    end

    def portfolio
        # Returns a unique list of all startups this venture capitalist has funded
        funding_rounds.map {|fundings| fundings.startup}.uniq

    end

    def biggest_investment
        # returns the largest funding round given by this venture capitalist
        investment = funding_rounds.map {|fundings| fundings.investment}.max
        FundingRound.all.select{|fundings| fundings.venture_capitalist == self && fundings.investment == investment}
    end

    def invested(domain)
        # given a domain string, returns the total amount invested in that domain
        investment_total = funding_rounds.select {|funding_round| funding_round.startup.domain == domain}
        investment_total{|funding_round| funding_round.investment}.sum

    end

end
