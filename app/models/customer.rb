class Customer < ActiveRecord::Base
	has_and_belongs_to_many :products
	has_and_belongs_to_many :orders
	has_one :cart
	has_many :delivery_addresses
	validates :first_name, :last_name, :email, presence: true
	validates :mobile_number, numericality: {only_integer: true}, length: {is: 10}
	# add validation email
end
