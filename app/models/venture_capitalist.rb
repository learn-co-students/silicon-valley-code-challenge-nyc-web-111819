class VentureCapitalist

    attr_reader :name, :total_worth

    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
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
        FundingRound.new(startup, self, type, investment)
    end 

    def funding_rounds
        FundingRound.all.select do |round|
            round.venture_capitalist == self 
        end 
    end 

    def portfolio
        unique_startups = funding_rounds.map do |round|
            round.startup
        end 
        unique_startups.uniq
    end 

    def largest_investment
        funding_rounds.max_by do |round|
            round.investment
        end 
    end 

    def invested(domain)
        self.funding_rounds.reduce(0) do |total, round|
            if round.startup.domain == domain
                total + round.investment
            end 
        end 
    end 

end
