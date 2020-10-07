class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :photo
      t.string :password
      t.string :bio

      t.timestamps
    end
  end
end