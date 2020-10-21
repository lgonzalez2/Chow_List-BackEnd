class UsersController < ApplicationController
    def index
        users = User.all
        render json: users, only: [:id, :username, :password, :photo, :bio], include: [:restaurants]
    end

    def show
        user = User.find(params[:id])
        render json: { id: user.id, username: user.username, photo: user.photo, bio: user.bio, restaurants: user.restaurants , favorite_restaurants: user.favorite_restaurants}
    end

    def update 
        user = User.find(params[:id])
        updated_user = user.update!(
            photo: params['photo'],
            bio: params['bio']
            )

        if updated_user 
            render json: {
                user: user
            }
        end 
    end 
end
