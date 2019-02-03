require 'pg'

class Peep


    attr_reader :list_of_peeps

    # def initialize
    #     @list_of_peeps = []
    # end

    def self.all
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'peep_database_test')
        else
            connection = PG.connect(dbname: 'peep_database_real')
        end
            result = connection.exec("SELECT * FROM peeps;")
            result.map do |peep|
                peep['peep']
            end
    end

    def self.add_peep_db(peep)
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'peep_database_test')
        else
            connection = PG.connect(dbname: 'peep_database_real')
        end
        result = connection.exec("INSERT INTO peeps (peep) VALUES ('#{peep}') RETURNING peep")

    end

    #
    #
    # def add_peep(peep)
    #     @list_of_peeps.push(peep)
    # end

end
