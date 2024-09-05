class AddInfoUrlToBirds < ActiveRecord::Migration[7.1]
  def change
    add_column :birds, :info_url, :string
  end
end
