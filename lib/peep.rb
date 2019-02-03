class Peep


    attr_reader :list_of_peeps


    def initialize
        @list_of_peeps = []
    end


    def add_peep(peep)
        @list_of_peeps.push(peep)
    end


end
