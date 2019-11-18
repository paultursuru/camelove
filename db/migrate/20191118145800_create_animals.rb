class CreateAnimals < ActiveRecord::Migration[5.2]
  def change
    create_table :animals do |t|
      t.string :name
      t.string :breed
      t.integer :age
      t.string :colour
      t.string :city
      t.integer :price
      t.text :description
      t.string :photo
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
