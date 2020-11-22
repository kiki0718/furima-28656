FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6, mix_case: true) }
    password_confirmation { password }
    first_name            { Gimei::Name.first }
    last_name             { Gimei::Name.last }
    first_name_furigana   { Gimei::Name.first.katakana }
    last_name_furigana    { Gimei::Name.last.katakana }
    birthday              { Faker::Date.in_date_period }
  end
end