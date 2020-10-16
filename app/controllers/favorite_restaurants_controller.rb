class FavoriteRestaurantsController < ApplicationController
    def index
        favorite_restaurants = FavoriteRestaurant.all
        render json: favorite_restaurants, only: [:id, :user_id, :restaurant_id]
    end

    def show
        favorite_restaurant = FavoriteRestaurant.find(params[:id])
        render json: favorite_restaurant
    end

    def create 
        favorite_restaurant = FavoriteRestaurant.find_or_create_by!(
            user_id: params['user_id'], 
            restaurant_id: params['restaurant_id'], 
        )

        if favorite_restaurant 
            render json: {
                status: :created,
                favorite_restaurant: favorite_restaurant
            } 
        else 
            render json: {status: 500}
        end 

    end
end
