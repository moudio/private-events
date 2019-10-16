class EventsController < ApplicationController

    def index
        @event = Event.all
    end

    def new
        @event = Event.new
    end

    def create
        @event = current_user.events.build(events_params)
        if @event.save
            flash[:sucess] = "Event created successfully"
            redirect_to event_path(@event)
        else
            flash.now[:danger] = "Failed to create a new event"
            render 'new'
        end
    end

    def show
    end


    private 

     def events_params
        params.require(:event).permit(:name, :location, :date)
     end 
end
