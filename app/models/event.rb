class Event < ApplicationRecord
    belongs_to :creator, class_name: "User"
    has_many :user_events, foreign_key: :attended_event_id
    has_many :attendees, through: :user_events, foreign_key: :attendee_id
end
