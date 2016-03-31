require 'rails_helper'

RSpec.describe Classroom, :type => :model do
  describe 'validations' do
    it { should validate_presence_of(:student_id) }
    it { should validate_presence_of(:course_id) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:student) }
    it { is_expected.to belong_to(:course) }
  end

  describe 'before_create' do
    describe '#set_entry_at' do
      let(:course) { create :course }
      let(:student) { create :student }

      it 'should have the entry_at value equal the current time of the register' do
        classroom = Classroom.create(student: student, course: course)

        expect(classroom.entry_at.strftime("%d/%m/%Y %H:%M")).to eq DateTime.now.strftime("%d/%m/%Y %H:%M")
      end
    end
  end
end
