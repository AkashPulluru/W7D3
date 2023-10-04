class SessionsController < ApplicationController
    before_action :require_logged_in, except: [:new, :create]
    before_action :require_logged_out, except: [:destroy]

    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.find_by_credentials(params[:user][:username], params[:user][:password])

        if @user 
            login(user)
            redirect_to user_url(@user)
        else
            @user = User.new(username: params[:user][:username])
            redirect_to :new
        end
    end

    def destroy
        log_out!
        redirect_to new_session_url
    end
end