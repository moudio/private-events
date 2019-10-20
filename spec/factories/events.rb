# frozen_string_literal: true

FactoryBot.define do
  factory :event do
    name { 'New Event' }
    location { 'Dakar' }
  end

  factory :future_event do
    date { '2019-12-02 08:00:00' }
  end

  factory :past_event do
    date { '2019-09-01 11:00:00' }
  end
end
