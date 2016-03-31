class Classroom < ActiveRecord::Base
  belongs_to :student
  belongs_to :course

  before_create :set_entry_at
  validates :student_id, :course_id, presence: true

  def set_entry_at
    self.entry_at = DateTime.now
  end

end
