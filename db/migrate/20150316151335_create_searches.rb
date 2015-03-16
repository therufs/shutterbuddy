class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :name
      t.text :link

      t.timestamps null: false
    end
  end
end
