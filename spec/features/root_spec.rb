require "rails_helper"

RSpec.describe "root" do
  it "displays a link to play game" do
    visit "/"
    expect(page).to have_content("Guess the bird by the sound!")
    expect(page).to have_link("game")
    click_link("Bird Call Quiz")
    expect(page).to have_current_path("/game")
  end
end