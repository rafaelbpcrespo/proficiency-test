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

  describe '#number_of_classrooms' do
    let(:course) { create :course }
    let(:course2) { create :course }
    let(:student) { create :student }

    it 'should return 2 when the student is registered on 2 courses with status OPENED' do
      classroom1 = create :classroom, student: student, course: course
      classroom2 = create :classroom, student: student, course: course2
      expect(student.number_of_classrooms).to eq 2
    end

    it 'should return 1 when the student is registered on 2 courses and one of them is with status CLOSED' do
      classroom2 = create :classroom, student: student, course: course2
      classroom1 = create :classroom, student: student, course: course
      course2.status = 0
      course2.save

      expect(student.number_of_classrooms).to eq 1
    end
  end

  describe '#active?' do
    let(:student) { create :student }

    it 'should return true when status is equal 1' do
      expect(student.active?).to be_truthy
    end

    it 'should return true when status is equal 1' do
      student.status = 0
      student.save
      expect(student.active?).to be_falsey
    end
  end
end
