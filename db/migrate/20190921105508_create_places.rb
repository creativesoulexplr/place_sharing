class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
      t.string :lat
      t.string :lng
      t.integer :user_id
      t.string :title
      t.text :details
      t.text :full_address

      t.timestamps
    end
  end
end
