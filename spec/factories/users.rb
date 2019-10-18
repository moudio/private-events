FactoryBot.define do
  factory :user do
    username { "redvan" }
    email { "user@gmail.com" }
    password { "MyString" }
    password_confirmation { "MyString" }
  end
end
