require 'rails_helper'

RSpec.describe EventsController, type: :controller do
    describe "Event index page" do
        let(:user) { create(:user) }

        let(:past_events_array) { Event.create(name: "Past event", location: "the past", date: "2019-10-16 10:40:21", creator_id: user.id) }

        let(:upcoming_events_array) { Event.create(name: "Past event", location: "the past", date: "2020-01-16 10:40:21", creator_id: user.id) }

        it "Renders all events" do
            get :index
            expect(response).to render_template(:index)
        end

        it "Filters and renders past events" do
            get :index
            expect(assigns(:past_events)).to eq([past_events_array])
        end

        it "Filters and renders upcoming events" do
            get :index
            expect(assigns(:upcoming_events)).to eq([upcoming_events_array])
        end


    end
end