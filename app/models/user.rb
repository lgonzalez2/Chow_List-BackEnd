class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }
   
    has_many :favorite_restaurants
    has_many :restaurants, through: :favorite_restaurants
    has_many :reviews
end
