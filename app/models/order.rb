class Order < ActiveRecord::Base
	has_and_belongs_to_many :products
	has_and_belongs_to_many :customers
	has_one :delivery_address
end
