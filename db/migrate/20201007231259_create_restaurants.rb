class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :image
      t.string :website
      t.string :price_level
      t.string :rating
      t.integer :location_id
      t.timestamps
    end
  end
end
