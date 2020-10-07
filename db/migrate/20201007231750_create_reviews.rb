class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :description
      t.float :rating
      t.integer :user_id
      t.integer :restaurant_id

      t.timestamps
    end
  end
end
