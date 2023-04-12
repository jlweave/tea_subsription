FactoryBot.define do
  factory :subscription do
    association :tea
    association :customer
    title { Faker::Subscription.plan }
    price { Faker::Number.between(from: 500, to: 100) }
    status { Faker::Subscription.status }
    frequency { Faker::Subscription.payment_term }
  end
end
