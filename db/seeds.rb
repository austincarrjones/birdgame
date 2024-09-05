require 'csv'

CSV.foreach(Rails.root.join("db", "data", "Birdgame.csv"), headers: true) do |row|
  Bird.create(
    name: row["name"],
    image_url: row["image_url"],
    info_url: row["info_url"],
    sound_file: row["sound_file"]
  )
end