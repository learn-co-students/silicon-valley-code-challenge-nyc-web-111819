class Startup
    attr_reader :founder, :domain, :name

    @@all = [] 
    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain

        @@all << self
    end

    def pivot(domain, name)
        #given a string of a domain and a string of a name, 
        #change the domain and name of the startup. This is the only public method through which the domain can be changed.
        @domain = domain
        @name = name
    end

    def self.all
        @@all
    end

    def self.find_by_founder(founder)
        #given a string of a founder's name, returns the first startup whose founder's name matches
        all.select{|startup| startup.founder == founder}
    end

    def self.domains
        #return all the domains in startups
        all.map {|startups| startups.domain}
    end

    def sign_contract(venture_capitalist, type, investment)
        # given a venture capitalist object, type of investment (as a string), and the amount 
        # invested (as a float), creates a new funding round and associates it with that startup and venture capitalist.
        FundingRound.new(self, venture_capitalist, type, investment)
    end

    def funding_rounds 
        FundingRound.all.select {|funds| funds.startup == self}
    end

    def num_funding_rounds
        # Returns the total number of funding rounds that the startup has gotten
        funding_rounds.length
    end

    def total_funds
        # Returns the total sum of investments that the startup has gotten
        funding_rounds.map {|funds| funds.investment}.sum
    end

    def investors
       # Returns a unique array of all the venture capitalists that have invested in this company
        funding_rounds.map {|funds| funds.venture_capitalist}.uniq
    end

    def big_investors
        # Returns a unique array of all the venture capitalists that have 
        # invested in this company and are in the Trés Commas club
        VentureCapitalist.tres_commas_club & investors
    end

end
