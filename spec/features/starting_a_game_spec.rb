require "spec_helper"

feature "starting a new game" do
  scenario "I am asked to enter my name" do
    visit '/'
    click_link "New game"
    expect(page).to have_content "What's your name?"
    fill_in "name_field", with: "Bob"
    click_on "submit_btn"
    expect(page).to have_content "Bob"
  end


  scenario "user does not enter their name" do
  	visit '/'
  	click_link "New Game"
  	expect(page).to have_content "What's your name?"
  	click_on "submit_btn"
  	expect(page).to have_content "What's your name?"
  end

end