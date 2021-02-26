FactoryBot.define do
  factory :book do
    title { "MyString" }
    author { "MyString" }
    description { "MyText" }
    status { 0 }
    user_id { 1 }
  end
end
