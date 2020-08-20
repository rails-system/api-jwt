class AddDateOfBirthColumnToProfile < ActiveRecord::Migration[6.0]
  def change
    add_column :profiles, :dob, :date
  end
end
