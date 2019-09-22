class CreatePlacesUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :places_users do |t|
      t.integer :user_id
      t.integer :place_id
    end
  end
end
