class Bird < ApplicationRecord
  validates_presence_of :name,
                        :info_url,
                        :sound_file,
                        :image_url
end