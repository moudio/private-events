module ApplicationHelper

    def current_user
        if (user_id = session[:user_id])
            @current_user ||= User.find_by(id: user_id)
        end
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
