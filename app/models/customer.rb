class Customer < ActiveRecord::Base
	has_and_belongs_to_many :products
	has_and_belongs_to_many :orders
	has_one :cart
	has_many :delivery_addresses
end
