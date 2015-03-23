class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.text :url
      t.integer :photo_id

      t.timestamps null: false
    end
  end
end
