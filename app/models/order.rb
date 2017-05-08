class Order < ActiveRecord::Base
	belongs_to :customer
	has_many :products
	belongs_to :delivery_address
end
