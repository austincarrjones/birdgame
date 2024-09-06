require "rails_helper"

describe "Game show page", type: :feature do

  it "displays the bird's sound file" do
    Bird.create(name: "Pine Siskin", 
                sound_file: "/sounds/XC880311 - Pine Siskin - Spinus pinus.mp3", 
                image_url: "https://cdn.download.ams.birds.cornell.edu/api/v1/asset/306420291/1800", 
                info_url: "https://ebird.org/species/pinsis") 
    
    visit game_path
    
    expect(page).to have_selector("audio")
    expect(page).to have_css("audio > source[src='/sounds/XC880311 - Pine Siskin - Spinus pinus.mp3']")
  end

  it "displays a form with multiple-choice options to submit a guess" do
    Bird.create(name: "Pine Siskin", 
                sound_file: "/sounds/XC880311 - Pine Siskin - Spinus pinus.mp3", 
                image_url: "https://cdn.download.ams.birds.cornell.edu/api/v1/asset/306420291/1800", 
                info_url: "https://ebird.org/species/pinsis") 
    other_bird1 = Bird.create(name: "Black-billed Magpie", 
                              sound_file: "/sounds/XC361480 - Black-billed Magpie - Pica hudsonia.mp3", 
                              image_url: "https://cdn.download.ams.birds.cornell.edu/api/v1/asset/302389441/1800", 
                              info_url: "https://ebird.org/species/bkbmag1") 
    other_bird2 = Bird.create(name: "Mountain Chickadee", 
                              sound_file: "/sounds/XC558338 - Mountain Chickadee - Poecile gambeli.mp3", 
                              image_url: "https://cdn.download.ams.birds.cornell.edu/api/v1/asset/302474581/1800", 
                              info_url: "https://ebird.org/species/mouchi") 
    other_bird3 = Bird.create(name: "White-crowned Sparrow", 
                              sound_file: "/sounds/XC285405 - White-crowned Sparrow - Zonotrichia leucophrys gambelii.mp3", 
                              image_url: "https://cdn.download.ams.birds.cornell.edu/api/v1/asset/64978031/1800", 
                              info_url: "https://ebird.org/species/whcspa") 
    
    visit game_path

    expect(page).to have_selector("form")

    expect(page).to have_selector("input[type=radio][value='Pine Siskin']")
    expect(page).to have_selector("input[type=radio][value='Black-billed Magpie']")
    expect(page).to have_selector("input[type=radio][value='Mountain Chickadee']")
    expect(page).to have_selector("input[type=radio][value='White-crowned Sparrow']")
  
    choose "Pine Siskin"
    click_button "Submit Guess"

    expect(page).to have_content("Correct! It's a Pine Siskin.")
  end

  it "displays a link to learn more about the bird" do
    expect(page).to have_link("Learn More about the Pine Siskin", href: bird.info_url)

    learn_more_link = find_link("Learn More about the Pine Siskin")
    expect(learn_more_link[:target]).to eq("_blank")
  end
end