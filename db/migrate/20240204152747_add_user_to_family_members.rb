class AddUserToFamilyMembers < ActiveRecord::Migration[7.1]
  def change
    add_reference :family_members, :user, null: false, foreign_key: true
  end
end
