class Course < ActiveRecord::Base

  validates :name, :description, :status, presence: true

  has_many :classrooms
  has_many :students, through: :classrooms

  has_enumeration_for :status, with: CourseStatus

  validates_associated :classrooms

  def opened?
    self.status == 1
  end
end
