require 'peep'

describe Peep do
    subject(:peep) {Peep.new}
    let(:single_peep) {double(:single_peep)}
    let(:time) {double(:time)}
    let(:single_peep2) {double(:single_peep2)}
    let(:time2) {double(:time2)}
    let(:single_peep3) {double(:single_peep3)}
    let(:time3) {double(:time3)}


    describe '#all' do
        it 'displays a list of all peeps' do
            connection = PG.connect(dbname: 'peep_database_test')

            result = Peep.add_peep_db(single_peep, time)
            Peep.add_peep_db(single_peep2, time2)
            Peep.add_peep_db(single_peep3, time3)
            
            peeps = Peep.all

            expect(peeps.length).to eq(3)
            expect(peeps.first).to be_a Peep
            expect(peeps.first.time).to eq(result.time)
            expect(peeps.first.peep).to eq(result.peep)

        end
    end

    # describe '#add_peep_db' do
    #     it 'adds a peep to the db' do
    #       connection = PG.connect(dbname: 'peep_database_test')
    #
    #       result = Peep.add_peep_db('TEST 1')
    #
    #       expect
    #
    #     end
    # end

end
