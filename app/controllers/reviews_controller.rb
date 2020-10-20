class ReviewsController < ApplicationController
    def index
        reviews = Review.all
        render json: reviews, only: [:id, :description, :rating, :user_id, :restaurant_id], include: [:user, :restaurant]
    end

    def show
        review = Review.find(params[:id])
        render json: review
    end

    def create 
        review = Review.create!(
            description: params['description'],
            rating: params['rating'],
            user_id: params['user_id'], 
            restaurant_id: params['restaurant_id'], 
        )

        if review
            render json: {
                status: :created,
                review: review
            } 
        else 
            render json: {status: 500}
        end 

    end
end
