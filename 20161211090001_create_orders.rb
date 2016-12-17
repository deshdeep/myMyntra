class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
	  t.integer  :order_quantity
	  t.float    :gross_total
      t.timestamps null: false
    end
  end
end
