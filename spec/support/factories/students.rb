# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :student do
    sequence(:name) { |n| "Estudante #{n}" }
    sequence(:register_number) { |n| "#{n}" }
    status 1
  end
end
