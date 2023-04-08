FactoryBot.define do
  factory :subscription do
    association :tea
    association :customer
    title { Faker::Subscription.plan }
    price { Faker::Number.decimal(l_digits: 2, r_digits: 2) }
    status { Faker::Subscription.status }
    fequencey { Faker::Subscription.payment_term }
  end
end
