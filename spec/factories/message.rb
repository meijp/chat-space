FactoryGirl.define do
  factory :message do

    body { Faker::Lorem.sentence }
    image Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/img/sample.jpg'))
    #current_userテストのため、メンターの方が、id番号1を追加しました。
    group_id 1
    user_id 1
  end
end
