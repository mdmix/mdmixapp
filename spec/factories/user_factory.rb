FactoryBot.define do
  sequence(:email) { |n| "user#{n}@example.com" }

  factory :user do
    email
    password { "woohoo" }
    admin { false }
  end

  factory :admin, class: User do
    email
    password { "youpiyoupi" }
    admin { true }
  end
end
