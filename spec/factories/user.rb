FactoryGirl.define do
  factory :user do
    sequence(:id){|n| n}
    name { Faker::Pokemon.name }
    email { Faker::Internet.email }
    password {Faker::Number.number(8)}

  end
end
