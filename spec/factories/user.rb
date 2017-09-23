FactoryGirl.define do
  pass = Faker::Internet.password(8)

  factory :user do
    sequence(:id){|n| n}
    name { Faker::Pokemon.name }
    email { Faker::Internet.email }
    password              pass
    password_confirmation pass

    after(:create) do |user|
      temp_group = create(:group)
      # ここでgroupをcreateしてtemp_groupに入れる
      create(:message, user: user, group: temp_group)
      create(:member, user: user, group: temp_group)
    end
  end
end
