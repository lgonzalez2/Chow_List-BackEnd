class RegistrationsController < ApplicationController
    def create 
        user = User.create!(
            username: params['username'],
            password: params['password'],
            password_confirmation: params['password_confirmation'],
            photo: params['photo'],
            bio: params['bio']
        )

        if user 
            session[:user_id] = user.id
            render json: {
                status: :created,
                user: user
            } 
        else 
            render json: {status: 500}
        end 
    end 
end 