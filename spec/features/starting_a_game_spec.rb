require "spec_helper"

feature "starting a new game" do # => Synonyms for Describe
  scenario "I am asked to enter my name" do # => Synonym for it
    visit '/'
    click_link "New game"
    expect(page).to have_content "What's your name?"
  end
end
