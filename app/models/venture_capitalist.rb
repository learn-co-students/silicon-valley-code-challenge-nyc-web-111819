class VentureCapitalist
  attr_accessor :name, :total_worth

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
    self.all.select {|venture_capitalist| venture_capitalist.total_worth >= 1000000000}
  end
 
  def offer_contract(startup, type, investment)
    FundingRound.new(startup, self, type, investment)
  end

  def funding_rounds
    FundingRound.all.select {|funding_round| funding_round.venture_capitalist == self}
  end

  def portfolio
    startups_list = funding_rounds.map {|funding_round| funding_round.startup}
    startups_list.uniq
  end

  def biggest_investment
    funding_rounds.max {|a,b| a.investment <=> b.investment}
  end

  def invested(domain)
    # given a **domain string**, returns the total amount invested in that domain
    all_rounds_of_domain = funding_rounds.select {|funding_round| funding_round.startup.domain == domain}
    all_rounds_of_domain.map {|funding_round| funding_round.investment}.sum
    
  end

end
