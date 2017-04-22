require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the anagrams path', {:type => :feature}) do
  it('processes the user entry and returns if it is an anagram') do
    visit('/')
    fill_in('first_phrase', :with => 'Tom Marvolo Riddle.')
    fill_in('second_phrase', :with => 'I am Lord Voldemort!!!')
    click_button('reveal')
    expect(page).to have_content("These words are anagrams")
  end
end
