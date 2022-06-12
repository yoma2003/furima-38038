FactoryBot.define do
  factory :order_address do
    transient do
      user { FactoryBot.create(:user) }
      item { FactoryBot.create(:item) }
    end
    post_code     { "000-0000"}
    prefecture_id { rand(2..48) }
    municipality  { Faker::Lorem.word }
    address       { Faker::Lorem.word }
    building_name { Faker::Lorem.word }
    phone_number  { "09012341234" }
    user_id       { user.id }
    item_id       { item.id }
  end
end