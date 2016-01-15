FactoryGirl.define do
  factory :bar do
    name { Faker::Company.catch_phrase }
    street { Faker::Address.street_address }
    city { Faker::Address.city }
    state { Faker::Address.state_abbr }
    zip { Faker::Address.zip_code }
  end
end