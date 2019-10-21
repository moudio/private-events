# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'user with valid data' do
    let(:user_valid) { User.new(username: 'user1', email: 'user1@example.com', password: 'password', password_confirmation: 'password') }

    describe 'user valid model' do
      it 'checks if the user model is valid' do
        expect(user_valid).to be_valid
      end
    end
  end

  context 'user with invalid data' do
    let(:user_invalid) { User.new(username: ' ', password: 'password', password_confirmation: 'password') }

    describe 'user invalid model' do
      it 'checks if the user email exists' do
        user_invalid.email = ' '
        expect(user_invalid).not_to be_valid
      end

      it 'checks if the username is unique' do
        user_invalid.username = 'michael'
        user_invalid.save
        user2 = User.create(username: 'michael', password: '123456', password_confirmation: '123456')
        expect(user2).not_to be_valid
      end
    end
  end

  context 'checking for users associations' do
    let(:user) { create(:user) }
    let(:event) { user.events.build(name: 'Example event 1', location: 'Mbour', date: '2019-12-02 08:00:00') }
    describe 'user associations' do
      it 'checks if the user has many events' do
        event.save
        expect(user.events.length).to eq(1)
      end

      it 'checks if user has attended events' do
        user.attended_events << event
        user.save
        expect(user.attended_events.length).to eq(1)
      end
    end
  end
end
