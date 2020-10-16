class RestaurantsController < ApplicationController
    def index
        restaurants = Restaurant.all
        render json: restaurants, only: [:id, :name, :image, :website, :price_level, :rating], include: [:location]
    end

    def show
        restaurant = Restaurant.find(params[:id])
        render json: restaurant
    end

    def create 
        restaurant = Restaurant.find_or_create_by!(
            name: params['name'], 
            image: params['image'], 
            website: params['website'], 
            price_level: params['price_level'], 
            rating: params['rating'], 
            location_id: params['location_id'])

        if restaurant 
            render json: {
                status: :created,
                restaurant: restaurant
            } 
        else 
            render json: {status: 500}
        end 

    end
end
