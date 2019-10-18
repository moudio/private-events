FactoryBot.define do
  factory :event do
    name { "New Event" }
    location { "Dakar" }
    date { "2019-10-16 10:40:21" }
    creator_id { 1 }
  end
end
