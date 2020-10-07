class Restaurant < ApplicationRecord
    has_many :favorite_restaurants
    has_many :users, through: :favorite_restaurants
    belongs_to :location
end
