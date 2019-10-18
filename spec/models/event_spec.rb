require 'rails_helper'

RSpec.describe Event, type: :model do
    let(:user) { User.new(username: "user1", email: "user1@example.com", password: "password", password_confirmation: "password") }

    let(:event) { Event.new(name: "event1", location: "somewhere", date: "1980/10/10") }

    it "Checks if Event model is valid" do
        user.save
        event.creator_id = user.id
        expect(event).to be_valid
    end
context "Checking for the Event validations" do 

    it "Checks if the event name is valid " do 
        event.name = " "
        user.save
        event.creator_id = user.id
        expect(event).not_to be_valid
    end 

    it "Checks if the event name is too short " do 
        event.name = "aa"
        user.save
        event.creator_id = user.id
        expect(event).not_to be_valid

    end
        it "Checks if the event location is present " do 
            event.location = " "
            user.save
            event.creator_id = user.id
            expect(event).not_to be_valid
        end 
     
        it "Checks if the event location's length is too short " do 
            event.location = "bb"
            user.save
            event.creator_id = user.id
            expect(event).not_to be_valid
        end 

end 
end