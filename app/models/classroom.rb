class Classroom < ActiveRecord::Base
  belongs_to :student
  belongs_to :course

  before_create :set_entry_at

  validate :student_active?
  validate :course_opened?

  def set_entry_at
    self.entry_at = DateTime.now
  end

  def student_active?
    errors.add(:student, 'não está ativo') unless student.active?
  end

  def course_opened?
    errors.add(:course, 'não está aberto') unless course.opened?
  end
end
