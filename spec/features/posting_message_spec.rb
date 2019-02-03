require "capybara/rspec"
require_relative "../../app"


feature 'posting message' do
    scenario 'post message and see it displayed' do
        visit '/'
        click_on('View Bookmarks')
        fill_in('peepshow', with: 'Test Message')
        click_on('Post')
        expect(page).to have_content('Test Message')
    end
end
