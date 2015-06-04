class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :price, default:0
      t.boolean :is_online, default: false
      t.boolean :is_deleted, default: false

      t.timestamps null: false
    end
  end
end
