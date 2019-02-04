require 'pg'

class Peep

    attr_reader :peep, :time

    def initialize(peep, time)
        @peep = peep
        @time = time
    end

    def self.all
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'peep_database_test')
        else
            connection = PG.connect(dbname: 'peep_database_real')
        end

        result = connection.exec("SELECT * FROM peeps;")

        result.map do |peep|
            Peep.new(peep['peep'], peep['time'])
        end
    end

    def self.add_peep_db(peep, time)
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'peep_database_test')
        else
            connection = PG.connect(dbname: 'peep_database_real')
        end
        result = connection.exec("INSERT INTO peeps (peep, time) VALUES ('#{peep}', '#{time}') RETURNING peep, time")
        Peep.new(result[0]['peep'], result[0]['time'])
    end

end
