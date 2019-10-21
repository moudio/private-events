# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :user_events, foreign_key: :attended_event_id
  has_many :attendees, through: :user_events, foreign_key: :attendee_id
  validates :name, presence: true, length: { minimum: 5 }
  validates :location, presence: true, length: { minimum: 3 }

  scope :upcoming, -> { where('date >= ?', Time.zone.now) }
  scope :past, -> { where('date < ?', Time.zone.now) }

  #  def Event.upcoming
  #     upcoming = []
  #     arr = self.order(created_at: :desc)
  #     arr.each do |event|
  #         upcoming << event if event.date && event.date >= Time.zone.now
  #     end
  #     upcoming
  #  end

  #  def Event.past
  #     past = []
  #     arr = self.order(created_at: :desc)
  #     arr.each do |event|
  #         past << event if event.date && event.date < Time.zone.now
  #     end
  #     past
  #  end
end
