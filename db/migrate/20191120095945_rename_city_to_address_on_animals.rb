class RenameCityToAddressOnAnimals < ActiveRecord::Migration[5.2]
  def change
    rename_column :animals, :city, :address
  end
end
