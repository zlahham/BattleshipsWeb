require "spec_helper"

feature "starting a new game" do
  scenario "I am asked to enter my name" do
    visit '/'
    click_link "Take me to the Battleships!"
    expect(page).to have_content "To play please enter your name"
    fill_in "name_field", with: "Bob"
    click_on "submit_btn"
    expect(page).to have_content "Bob"
  end


  scenario "user does not enter their name" do
  	visit '/'
  	click_link "Take me to the Battleships!"
  	expect(page).to have_content "To play please enter your name"
  	click_on "submit_btn"
  	expect(page).to have_content "Disaster!"
  end
end

  feature "User can place ships on their board" do
    scenario "user can place a battleship on their board" do
      visit '/registered'
      select "A1", :from => "ship_coord"
      select "Horizontally", :from => "ship_direction"
      click_button "Place Ships"
      expect(page).to have_css("#bob", :text => "BBBB")
    end 
  end


  feature "User can start game after placing ships" do
    scenario "user can start game after placing a ship" do
      visit '/registered'
      select "A1", :from => "ship_coord"
      select "Horizontally", :from => "ship_direction"
      click_button "Place Ships"
      click_link "Start Game"
      expect(page).to have_content "I am the gameplay page"
    end
  end

  feature "User can fire at opponent board" do
    scenario "user can fire and fire will show on opponent board" do
      visit '/game_play'
      fill_in "coord", with: "A1"
      click_button "Fire!"
      expect(page).to have_css("#p2_own", :text => "*")
    end
  end 

  feature "Adding a new player" do
    scenario "a second user joins the party" do
      visit '/'

    end
  end 








