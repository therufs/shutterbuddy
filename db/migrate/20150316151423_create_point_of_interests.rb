class CreatePointOfInterests < ActiveRecord::Migration
  def change
    create_table :point_of_interests do |t|
      t.string :name
      t.text :link
      t.integer :search_id

      t.timestamps null: false
    end
  end
end
