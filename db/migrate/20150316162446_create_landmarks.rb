class CreateLandmarks < ActiveRecord::Migration
  def change
    create_table :landmarks do |t|
      t.string :name
      t.text :link
      t.integer :search_id

      t.timestamps null: false
    end
  end
end
