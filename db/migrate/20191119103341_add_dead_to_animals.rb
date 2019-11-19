class AddDeadToAnimals < ActiveRecord::Migration[5.2]
  def change
    add_column :animals, :dead, :boolean, default: false
  end
end
