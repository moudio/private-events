class EventsController < ApplicationController
    before_action :require_user, except: [ :show, :index ]

    def index
        @upcoming_events = Event.upcoming
        @past_events = Event.past
    end

    def new
        @event = Event.new
    end

    def create
        @event = current_user.events.build(events_params)
        if @event.save
            flash[:success] = "Event created successfully"
            redirect_to event_path(@event)
        else
            flash.now[:danger] = "Failed to create a new event"
            render 'new'
        end
    end

    def show
        @event = Event.find(params[:id])
    end


    private 

     def events_params
        params.require(:event).permit(:name, :location, :date)
     end

     def require_user
        if !current_user
            flash[:danger] = "You have to login!"
            redirect_to root_url
        end 
     end
end
