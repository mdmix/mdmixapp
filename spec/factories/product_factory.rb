FactoryBot.define do
  sequence(:name) { |n| "flick#{n}" }

  factory :product do
    name
    description {"Good stuff"}
    price {25.0}
  end
end
