class CreateAtoms < ActiveRecord::Migration
  def change
    create_table :atoms do |t|
      t.string :.

      t.timestamps null: false
    end
  end
end
