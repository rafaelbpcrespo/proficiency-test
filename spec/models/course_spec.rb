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

  describe '#opened?' do
    let(:course) { create :course }

    it 'should return true when status is equal 1' do
      expect(course.opened?).to be_truthy
    end

    it 'should return true when status is equal 1' do
      course.status = 0
      course.save
      expect(course.opened?).to be_falsey
    end
  end
end
