class LocationsController < ApplicationController
    def index
        locations = Location.all
        render json: locations, only: [:id, :name, :geo_id]
    end

    def show
        location = Location.find(params[:id])
        render json: location
    end

    def create 
        location = Location.find_or_create_by!(name: params['name'], geo_id: params['geo_id'])

        if location 
            render json: {
                status: :created,
                location: location
            } 
        else 
            render json: {status: 500}
        end 

    end

end
