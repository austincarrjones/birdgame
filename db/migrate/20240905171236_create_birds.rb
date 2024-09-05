class CreateBirds < ActiveRecord::Migration[7.1]
  def change
    create_table :birds do |t|
      t.string :name
      t.string :sound_file
      t.string :image_url

      t.timestamps
    end
  end
end
