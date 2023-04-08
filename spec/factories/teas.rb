FactoryBot.define do
  factory :tea do
    title { Faker::Tea.variety }
    description { Faker::Tea.type }
    temperature { Faker::Number.number(digits:3) }
    brew_time { Faker::Number.decimal(l_digits: 1, r_digits: 2) }
  end
end
