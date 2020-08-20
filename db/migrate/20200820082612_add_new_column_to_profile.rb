class AddNewColumnToProfile < ActiveRecord::Migration[6.0]
  def change
    add_column :profiles, :marital_status, :integer
    add_column :profiles, :gender, :integer
    add_column :profiles, :with_whom, :integer
    add_column :profiles, :dating_type, :integer
    add_column :profiles, :dating_reason, :integer
    add_column :profiles, :quesion_1, :text
    add_column :profiles, :quesion_2, :text
    add_column :profiles, :quesion_3, :text
    add_column :profiles, :quesion_4, :text
    add_column :profiles, :quesion_5, :text
  end
end
