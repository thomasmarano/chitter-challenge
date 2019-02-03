require 'peep'

describe Peep do
    subject(:peep) {Peep.new}
    let(:single_peep) {double(:single_peep)}

    describe '#list_of_peeps' do
        it 'responds to list_of_peeps' do
            expect(peep).to respond_to(:list_of_peeps)
        end
    end

    describe '#add_peep' do
        it 'adds a peep to peep array' do
            expect{print peep.add_peep(:single_peep)}.to output{[:single_peep]}.to_stdout
        end
    end

end
