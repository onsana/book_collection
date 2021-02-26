FactoryBot.define do
  factory :user do
    id { 1 }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end
end
