# frozen_string_literal: true

class User < ApplicationRecord
  has_many :events, foreign_key: :creator_id, class_name: 'Event'
  has_many :user_events, foreign_key: :attendee_id
  has_many :attended_events, through: :user_events
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze

  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 25 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }

  has_secure_password

  def attend!(event)
    user_events.create!(attended_event_id: event.id)
  end

  def cancel!(event)
    @event = user_events.find_by(attended_event_id: event.id)
    @event&.destroy
  end

  def attending?(event)
    event.attendees.include?(self)
  end
end
