require 'peep'

describe Peep do
    subject(:peep) {Peep.new}
    let(:single_peep) {double(:single_peep)}

    describe '#add_peep_db' do
        it 'adds a peep to the database' do
            connection = PG.connect(dbname: 'peep_database_test')

            result = Peep.add_peep_db('TEST 1')
            Peep.add_peep_db('TEST 2')
            Peep.add_peep_db('TEST 3')

            peeps = Peep.all

            expect(peeps.length).to eq(3)
            expect(peeps.first).to eq(result.first['peep'])
            expect(peeps.first).to eq('TEST 1')
        end
    end



end
