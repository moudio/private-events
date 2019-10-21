# frozen_string_literal: true

require 'rails_helper'

feature 'User authorizations' do
  scenario "Guest users can't access the new event page" do
    visit new_event_path
    expect(page).to have_content('You have to login')
  end

  let(:user) { create(:user) }

  scenario "Signed-in user can't sign up again" do
    log_in user.email
    visit new_user_path
    expect(page).to have_content('You have to logout to create an account!')
  end
end
