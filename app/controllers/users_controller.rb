class UsersController < ApplicationController
    def index
        users = User.all
        render json: users, only: [:id, :username, :password, :photo, :bio]
    end

    def show
        user = User.find(params[:id])
        render json: user
    end
    
    private

    def user_params
        params.require(:user).permit(:username, :password, :photo, :bio)
    end
end
