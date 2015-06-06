class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      
    t.string :recipient
    t.string :address
    t.string :tel
    t.string :email
    t.string :will_receive_edm
    t.string :user_id
    
    t.timestamps null: false
    end
  end
end
