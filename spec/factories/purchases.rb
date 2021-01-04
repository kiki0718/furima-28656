FactoryBot.define do
  factory :purchase do
        postal_code     { '123-4567' }
        prefecture_id   { '2' }
        municipatities  { '札幌市' }
        building_name   { '札幌ビル' }
        house_number    { '札幌1−1' }
        phone_number    { '09012345678' }
        user_id         { '1' }
        token {"tok_abcdefghijk00000000000000000"}
  end
end
