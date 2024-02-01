class CreateFamilyMembers < ActiveRecord::Migration[7.1]
  def change
    create_table :family_members do |t|
      t.string :first_name
      t.string :last_name
      t.string :kinship
      t.text :description
      t.string :profile_title
      t.float :value_hour
      t.datetime :available_date

      t.timestamps
    end
  end
end
