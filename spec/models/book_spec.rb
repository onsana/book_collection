require "rails_helper"

RSpec.describe Book, type: :model do
  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:author) }
    it { should validate_presence_of(:description) }
  end

  describe "associations" do
    it { is_expected.to have_many(:genres) }
    it { should belong_to(:user) }
  end
end
