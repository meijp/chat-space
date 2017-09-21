FactoryGirl.define do
  factory :group do
    # sequence(:id){|n| n}
    name { Faker::Pokemon.name }
  end
end
