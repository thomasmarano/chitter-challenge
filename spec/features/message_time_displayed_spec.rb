require "capybara/rspec"
require_relative "../../app"


feature 'displays message time' do
    scenario 'app displays time a message was posted' do
        connection = PG.connect(dbname: 'peep_database_test')
        time = Time.new
        connection.exec("INSERT INTO peeps (peep, time) VALUES ('test', '#{time}');")
        visit '/'
        click_on('View All Peeps')
        expect(page).to have_content(time)
    end
end
