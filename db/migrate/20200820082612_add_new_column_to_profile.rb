class AddNewColumnToProfile < ActiveRecord::Migration[6.0]
  def change
    add_column :profiles, :marital_status, :string
    add_column :profiles, :gender, :string
    add_column :profiles, :with_whom, :string
    add_column :profiles, :dating_type, :string
    add_column :profiles, :dating_reason, :string
    add_column :profiles, :quesion_1, :text
    add_column :profiles, :quesion_2, :text
    add_column :profiles, :quesion_3, :text
    add_column :profiles, :quesion_4, :text
    add_column :profiles, :quesion_5, :text
  end
end
