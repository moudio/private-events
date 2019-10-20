require 'rails_helper'

RSpec.describe UserEvent, type: :model do
  let(:user) { User.create(username: "user1", email: "user1@example.com", password: "password", password_confirmation: "password") }
  let(:event) {Event.create(name:"First event", location: "Dakar", date:"1990/11/12", creator_id: user.id)}

  let(:user_event) { UserEvent.new(attendee_id: user.id , attended_event_id: event.id) }

  it "Checks if the User Event model is valid" do
    user_event.save
    expect(user_event).to be_valid
  end

  it "Checks if validations for User Event model are working" do 
    user_event.attended_event_id = nil 
    user_event.save
    expect(user_event).not_to be_valid
  end


end