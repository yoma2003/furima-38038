FactoryBot.define do
  factory :user do
    gimei = Gimei.name
    nickname              {Faker::Name.last_name}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {gimei.last.kanji}
    first_name            {gimei.first.kanji}
    kana_last_name        {gimei.last.katakana}
    kana_first_name       {gimei.first.katakana}
    date_of_birth         {Faker::Date.between(from: '1980-01-01', to: '2000-01-01')}
  end
end
