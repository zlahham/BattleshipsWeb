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
end
