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

end
