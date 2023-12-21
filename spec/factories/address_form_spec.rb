FactoryBot.define do
  factory :address_form do
    postal_code    { Faker::Number.leading_zero_number(digits: 3) + '-' + Faker::Number.leading_zero_number(digits: 4) }
    prefecture_id  { Faker::Number.between(from: 2, to: 48) }
    city           { Faker::Address.city }
    block          { Faker::Address.street_address }
    buildings_name { Faker::Company.name }
    phone_number   { Faker::Number.leading_zero_number(digits: 11) }
    token          {"tok_abcdefghijk00000000000000000"}
  end
end