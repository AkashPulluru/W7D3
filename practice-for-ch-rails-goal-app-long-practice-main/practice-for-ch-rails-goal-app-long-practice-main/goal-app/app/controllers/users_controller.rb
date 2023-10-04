class UsersController < ApplicationController 

    before_action :require_logged_out, only: [:new, :create]  
    before_action :require_logged_in, only: [:index, :show] 

    def index 
        @users = User.all 
        render :index 
    end 

    def show 
        @user = User.find(params[:id])
        render :show 
    end 

    def create 
        @user = User.new(user_params)

        if user.save 
            redirect_to user_url(@user)
        else 
            redirect_to :new 
        end 
    end 

    def new 
        render :new 
    end 

    private 

    def user_params
        params.require(:user).permit(:username, :password)
    end 


end 