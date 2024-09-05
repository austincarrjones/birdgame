require "rails_helper"

describe "Game show page", type: :feature do
  let!(:bird) { Bird.create(
                            name: "Pine Siskin", 
                            sound_file: "/sounds/XC880311 - Pine Siskin - Spinus pinus.mp3", 
                            image_url: "https://cdn.download.ams.birds.cornell.edu/api/v1/asset/306420291/1800", 
                            info_url: "https://ebird.org/species/pinsis"
                            ) }

  before do
    visit game_path
  end

  it "displays the bird's sound file" do
    expect(page).to have_selector("audio")
    expect(page).to have_css("audio > source[src='/sounds/XC880311 - Pine Siskin - Spinus pinus.mp3']")
  end

  it "displays a form to submit a guess" do
    expect(page).to have_selector("form")
    expect(page).to have_field("guess")
    expect(page).to have_button("Submit Guess")
  end

  it "displays a link to learn more about the bird" do
    expect(page).to have_link("Learn More about the Sparrow", href: bird.info_url)

    learn_more_link = find_link("Learn More about the Pine Siskin")
    expect(learn_more_link[:target]).to eq("_blank")
  end
end