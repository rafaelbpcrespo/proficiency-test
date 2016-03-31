require 'rails_helper'

RSpec.describe Course, :type => :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:status) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:students).through(:classrooms) }
  end
end
