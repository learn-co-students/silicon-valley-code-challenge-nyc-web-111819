class VentureCapitalist
    attr_reader :name, :total_worth, :rounds
    @@all = []
    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @rounds = []
        @@all << self
    end
    def self.all
        @@all
    end
    def self.tres_commas_club
        @@all.select{|investor| investor.total_worth > 1000000000}
    end
    def offer_contract(startup, type, amount)
        new = FundingRound.new(startup, self, type, amount)
        @rounds << new
    end
    def funding_rounds
        @rounds
    end
    def portfolio
        @rounds.map{|round| round.startup}.uniq
    end
    def biggest_investment
        array = @rounds.map{|round| round.investment}
        @rounds[array.index(array.max)]
    end
    def invested(domain)
        @rounds.select{|round| round.startup.domain == domain}.inject(:+)
    end
end
