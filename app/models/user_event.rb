# frozen_string_literal: true

class UserEvent < ApplicationRecord
  belongs_to :attendee, class_name: 'User'
  belongs_to :attended_event, class_name: 'Event'

  validates :attended_event_id, presence: true
end
