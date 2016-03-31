require 'rails_helper'

RSpec.describe Student, :type => :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:register_number) }
    it { should validate_presence_of(:status) }
    it { should validate_uniqueness_of(:register_number) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:courses).through(:classrooms) }
  end
end
