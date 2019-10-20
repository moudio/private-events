# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email])
    if user
      flash[:success] = 'You have successfully logged in'
      log_in user
      redirect_to user_path(user)
    else
      flash.now[:danger] = "This user doesn't exist yet"
      render 'new'

    end
  end

  def destroy
    flash[:success] = 'You have logged out'
    log_out
    redirect_to root_url
  end
end
