class SessionsController < ApplicationController
    def new
    end 
    
    def create 
        user = User.find_by(username: params[:session][:username])
        # debugger
        if user 
            flash[:notice] = "You have successfully logged in"
            log_in user
            redirect_to user_path(user)
        else 
            flash.now[:danger] = "This user doesn't exist yet"
            render 'new'
        
        end 
    end 

    def destroy 
        log_out
        redirect_to login_path

    end
end
