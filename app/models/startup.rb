class Startup
    attr_reader :name, :founder, :domain

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
    # given a string of a domain and a string of a name, change the domain and name of the startup
    @name = name
    @domain = domain
    self #return the re-tooled self
  end

  def self.find_by_founder(founder)
    all.find {|startup| startup.founder == founder}
  end

  def self.domains
    all.map {|startup| startup.domain}
  end

  def sign_contract(venture_capitalist, type, investment)
    FundingRound.new(self, venture_capitalist,type, investment)
  end

  def num_funding_rounds
    #counts unique strings in types
    all_funding_round_types = funding_rounds.map {|funding_round| funding_round.type} 
    all_funding_round_types.uniq.length
  end

  def total_funds
    all_investments = funding_rounds.map {|funding_round| funding_round.investment}
    all_investments.sum
  end

  def investors
    vc_list = funding_rounds.map {|funding_round| funding_round.venture_capitalist}
    vc_list.uniq
  end

  def big_investors
    VentureCapitalist.tres_commas_club & investors
  end



  # HELPER METHODS
  def funding_rounds
    FundingRound.all.select {|funding_round| funding_round.startup == self}
  end

end
