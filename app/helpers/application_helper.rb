# frozen_string_literal: true

module ApplicationHelper
  def current_user
    return unless (user_id = session[:user_id])

    @current_user ||= User.find_by(id: user_id)
  end

  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def upcoming_events
    upcoming = []
    @user.attended_events.each do |event|
      upcoming << event if event.date >= Time.zone.now
    end
    upcoming
  end

  def past_events
    past = []
    @user.attended_events.each do |event|
      past << event if event.date < Time.zone.now
    end
    past
  end
end
