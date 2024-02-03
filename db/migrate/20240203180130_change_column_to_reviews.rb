class ChangeColumnToReviews < ActiveRecord::Migration[7.1]
  def change
    remove_column :reviews, :family_member_id, :integer
    add_reference :reviews, :order, foreign_key: true
  end
end
