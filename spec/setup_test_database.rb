require 'pg'

def setup_test_database
    connection = PG.connect(dbname: 'peep_database_test')
    connection.exec('TRUNCATE peeps;')
end
