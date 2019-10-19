class UserEventsController < ApplicationController
    def create
        @event = Event.find(params[:user_event][:attended_event_id])
        current_user.attend!(@event)
        flash[:success] = "You have signed up successfully for that event"
        redirect_to event_path(@event)
    end

    def destroy
        @event = Event.find(params[:user_event][:attended_event_id])
        current_user.cancel!(@event)
        flash[:success] = "You have cancelled your event attendance successfully"
        redirect_to event_path(@event)
    end
end
