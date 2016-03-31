# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :course do
    sequence(:name) { |n| "Course #{n}" }
    description "Course Description"
    status 1
  end
end
