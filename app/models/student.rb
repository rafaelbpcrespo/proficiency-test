class Student < ActiveRecord::Base
  validates :name, :register_number, :status, presence: true
  validates :register_number, uniqueness: true

  has_enumeration_for :status, with: StudentStatus
end
