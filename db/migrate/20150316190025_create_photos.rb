class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :landmark_id
      t.text :url
      t.text :attribution

      t.timestamps null: false
    end
  end
end
