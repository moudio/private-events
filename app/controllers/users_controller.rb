class UsersController < ApplicationController
    before_action :no_sign_up, only: [ :new, :create ]

    def new 
        @user = User.new
    end 

    def create
        @user = User.create(user_params)
        if @user.save
            flash[:success] = "Sign up successful"
            log_in @user
            redirect_to user_path(@user)
        else
            flash[:danger] = "There has been a problem signing up"
            render 'new'
        end 

    end

    def show 
        @user = User.find(params[:id])

        @upcoming_events = upcoming_events
        @prev_events = past_events
    end 

    private 
    def user_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end 

    def no_sign_up
        if current_user
            flash[:danger] = "You have to logout to create an account!"
            redirect_to user_url(current_user)
        end
    end
end
