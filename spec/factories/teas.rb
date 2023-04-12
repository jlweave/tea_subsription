FactoryBot.define do
  factory :tea do
    title { Faker::Tea.variety }
    description { Faker::Tea.type }
    temperature { Faker::Number.between(from: 90, to: 212) }
    brew_time { Faker::Number.between(from: 120, to: 440)}
  end
end
