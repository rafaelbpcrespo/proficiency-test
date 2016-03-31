# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :classroom do
    student
    course
    entry_at "2016-03-31 18:24:35"
  end
end
