require 'rails_helper'

RSpec.describe Classroom, :type => :model do
  describe 'validations' do
    describe '#course_opened?' do
      let(:course) { create :course, status: 0 }
      let(:student) { create :student }

      context 'should have error' do
        it 'if the course is not opened' do
          classroom = Classroom.new(student: student, course: course)
          classroom.valid?
          expect(classroom.errors[:course].length).to eq 1
        end
      end

      context 'should not have error' do
        it 'if the course is opened' do
          course.status = 1
          course.save
          classroom = Classroom.new(student: student, course: course)
          classroom.valid?
          expect(classroom.errors[:course].length).to eq 0
        end
      end
    end

    describe '#student_active?' do
      let(:course) { create :course }
      let(:student) { create :student, status: 0 }

      context 'should have error' do
        it 'if the student is not active' do
          classroom = Classroom.new(student: student, course: course)
          classroom.valid?
          expect(classroom.errors[:student].length).to eq 1
        end
      end

      context 'should not have error' do
        it 'if the student is active' do
          student.status = 1
          student.save
          classroom = Classroom.new(student: student, course: course)
          classroom.valid?
          expect(classroom.errors[:student].length).to eq 0
        end
      end

    end
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
