# frozen_string_literal: true

require 'rails_helper'

feature 'Event creation' do
  let(:user) { User.create(username: 'user1', email: 'user1@example.com', password: 'password', password_confirmation: 'password') }

  let(:event) { Event.create(name: 'event1', location: 'somewhere', date: '1980/10/10-15:10') }

  scenario 'Logged in used can create and event ' do
    event.creator_id = user.id
    visit login_path
    login user.email
    visit new_event_path
    fill_in 'Name', with: event.name
    fill_in 'Location', with: event.location
    expect do
      click_on 'Create Event'
    end.to change(Event, :count).by(1)
    expect(event.creator).to eq user
  end

  scenario "Non-logged in user can't create an event" do
    event.creator_id = user.id
    visit new_event_path
    expect(page).to have_content('Welcome')
  end
end
