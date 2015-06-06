class RemoveEdmFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :will_receive_edm, :string
  end
end
