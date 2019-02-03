require 'peep'

describe Peep do
    subject(:peep) {Peep.new}
    let(:single_peep) {double(:single_peep)}

    # describe '#list_of_peeps' do
    #     it 'responds to list_of_peeps' do
    #         expect(peep).to respond_to(:list_of_peeps)
    #     end
    # end

    # describe '#add_peep' do
    #     it 'adds a peep to peep array' do
    #         expect{print peep.add_peep(:single_peep)}.to output{[:single_peep]}.to_stdout
    #     end
    # end

    describe '#add_peep_db' do
        it 'adds a peep to the database' do
            connection = PG.connect(dbname: 'peep_database_test')
            Peep.add_peep_db('TEST')
            peeps = Peep.all
            expect(peeps).to include('TEST')
        end
    end
end
#
# connection = PG.connect(dbname: 'complete_test_bm')
#
# bookmark = Bookmark.create('https://www.twitter.com', 'Twitter')
# Bookmark.create('https://www.google.com', 'Google')
# Bookmark.create('https://www.facebook.com', 'Facebook')
#
# bookmarks = Bookmark.all
# p 'TEST'
# p bookmark
#
# expect(bookmarks.length).to eq(3)
# expect(bookmarks.first).to eq(bookmark)
# expect(bookmarks.first.url]).to eq(bookmark['url'])
# expect(bookmarks.first.title).to eq(bookmark['title'])
