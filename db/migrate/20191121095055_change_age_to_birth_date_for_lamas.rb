class ChangeAgeToBirthDateForLamas < ActiveRecord::Migration[5.2]
  def change
    remove_column :animals, :age
    add_column :animals, :birth_date, :date
  end
end
