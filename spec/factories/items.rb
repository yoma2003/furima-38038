FactoryBot.define do
  factory :item do
    name               { Faker::Lorem.words }
    describe           { Faker::Lorem.sentence }
    category_id        { rand(2..11) }
    condition_id       { rand(2..7) }
    delivery_charge_id { rand(2..3) }
    prefecture_id      { rand(2..48) }
    days_to_ship_id    { rand(2..4) }
    price              { rand(300..10_000) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
