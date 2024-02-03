class AddDateToOrders < ActiveRecord::Migration[7.1]
  def change
    add_column :orders, :rent_date, :datetime
  end
end
