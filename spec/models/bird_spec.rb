require 'rails_helper'

RSpec.describe Bird, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :image_url }
    it { should validate_presence_of :info_url }
    it { should validate_presence_of :sound_file }
  end
end
