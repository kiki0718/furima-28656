FactoryBot.define do
  factory :item do
    name              { Faker::Lorem.characters(number: 40) }
    association :user
    description       { Faker::Lorem.characters(number: 1000) }
    price             { Faker::Number.between(from: 300, to: 9999999) }
    category_id       { Faker::Number.between(from: 2, to: 11) }
    status_id         { Faker::Number.between(from: 2, to: 6) }
    delivery_fee_id   { Faker::Number.between(from: 2, to: 3) }
    prefecture_id     { Faker::Number.between(from: 2, to: 47) }
    ship_day_id       { Faker::Number.between(from: 2, to: 4) }
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
