class SessionsController < ApplicationController
    def new
    end 
    
    def create 
        user = User.find_by(username: params[:session][:username])
        if user 
            flash[:notice] = "You have successfully logged in"
            session[:user_id] = user.id 
            redirect_to user_path(user)
        else 
            flash.now[:danger] = "This user doesn't exist yet"
            render 'new'
        
        end 
    end 

    def destroy 
        session[:user_id] = nil 
        redirect_to login_path

    end
end
