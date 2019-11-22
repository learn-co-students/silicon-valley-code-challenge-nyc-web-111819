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
        all.select{|startup| startup.founder == founder}[0]
    end

    def self.domains
        #return all the domains in startups
        all.map {|startups| startups.domain}
    end

end
