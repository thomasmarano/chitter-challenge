require "capybara/rspec"
require_relative "../../app"


feature 'displays message time' do
    scenario 'app displays time a message was posted' do
        visit '/'
        click_on('View All Peeps')
    end
end
