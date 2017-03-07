class Customer < ActiveRecord::Base
	has_and_belongs_to_many :products
	has_and_belongs_to_many :orders
	has_one :cart
	has_many :delivery_addresses
	
	validates :first_name, :email, presence: true
	validates :mobile_number, numericality: {only_integer: true}, length: {is: 10}
	validates :password, presence:true, length: {minimum: 6}, allow_nil: true
	
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
					
	has_secure_password
	
end
