class Course < ActiveRecord::Base

  validates :name, :description, :status, presence: true

  has_enumeration_for :status, with: CourseStatus
end
