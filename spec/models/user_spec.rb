require 'rails_helper'

RSpec.describe User, type: :model do
  context "user with valid data" do
    let(:user_valid) { User.new(username: "user1", email: "user1@example.com", password: "password", password_confirmation: "password") }
    
    describe "user valid model" do
    
      it "checks if the user model is valid" do
        expect(user_valid).to be_valid
      end

    end
  end
    
  context "user with invalid data" do
    let(:user_invalid) { User.new(username: " ", password: "password", password_confirmation: "password") }
    
    describe "user invalid model" do

      it "checks if the user email exists" do
        user_invalid.email = " "
        expect(user_invalid).not_to be_valid
      end

      it "checks if the username is unique" do
        user_invalid.username = "michael"
        user_invalid.save
        user2 = User.create(username: "michael", password: "123456", password_confirmation: "123456")
        expect(user2).not_to be_valid
      end

    end
  end
end
