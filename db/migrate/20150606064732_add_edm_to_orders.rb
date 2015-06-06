class AddEdmToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :will_receive_edm, :boolean
  end
end
