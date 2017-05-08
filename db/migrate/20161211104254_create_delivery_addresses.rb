class CreateDeliveryAddresses < ActiveRecord::Migration
  def change
    create_table :delivery_addresses do |t|
	  t.text     :address
	  t.string   :email
	  t.string   :mobile_number
	  t.references :customer, index:true, foreign_key:true
      t.timestamps null: false
    end
  end
end
