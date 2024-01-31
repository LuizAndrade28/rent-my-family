class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.integer :quantity_hour
      t.references :user, null: false, foreign_key: true
      t.references :family_member, null: false, foreign_key: true

      t.timestamps
    end
  end
end
