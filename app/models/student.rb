class Student < ActiveRecord::Base
  validates :name, :register_number, :status, presence: true
  validates :register_number, uniqueness: true

  has_enumeration_for :status, with: StudentStatus
  has_many :classrooms
  has_many :courses, through: :classrooms

  validates_associated :classrooms

  def number_of_classrooms
    courses.where(status: 1).count
  end

end
