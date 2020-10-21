class RestaurantsController < ApplicationController
    def index
        restaurants = Restaurant.all
        render json: restaurants, only: [:id, :name, :image, :website, :price_level, :rating], include: [:location, :favorite_restaurants]
    end

    def show
        restaurant = Restaurant.find(params[:id])
        render json: {id: restaurant.id, name: restaurant.name, image: restaurant.image, website: restaurant.website, price_level: restaurant.price_level, rating: restaurant.rating, favorite_restaurants: restaurant.favorite_restaurants}
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
