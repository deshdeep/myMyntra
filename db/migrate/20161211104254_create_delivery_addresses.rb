class CreateDeliveryAddresses < ActiveRecord::Migration
  def change
    create_table :delivery_addresses do |t|
	  t.text     :delivery_address
	  t.string   :delivery_email
	  t.string   :delivery_mobile_number
	  t.belongs_to :customer, index: true
	  t.belongs_to :order, index: true
      t.timestamps null: false
    end
  end
end
