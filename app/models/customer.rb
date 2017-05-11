class Customer < ActiveRecord::Base
	#attr_accessor :remember_token
	before_save { self.email = email.downcase }
    
	has_many :delivery_addresses
	has_many :orders
	has_many :products, through: :orders
	has_one  :cart

	#validates :first_name, presence: true
	#validates :mobile_number, numericality: {only_integer: true}, length: {is: 10}
	
	
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	#validates :email, presence: true, length: { maximum: 255 },
    #                format: { with: VALID_EMAIL_REGEX },
    #                uniqueness: { case_sensitive: false }

	#has_secure_password
	#validates :password, presence: true, length: {minimum: 6}, allow_nil: true

	# Returns the hash digest of the given string.
    def Customer.digest(string)
		cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
													  BCrypt::Engine.cost
		BCrypt::Password.create(string, cost: cost)
	end
	
    # Returns a random token.
	def Customer.new_token
	  SecureRandom.urlsafe_base64
	end
	
=begin	
	# Remembers a customer in the database for use in persistent sessions.
    def remember
      self.remember_token = Customer.new_token
      update_attribute(:remember_digest, Customer.digest(remember_token))
    end
	
	# Returns true if the given token matches the digest.
    def authenticated?(remember_token)
	  return false if remember_digest.nil?
      BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end
	
	# Forgets a customer.
    def forget
	  update_attribute(:remember_digest, nil)
    end
=end
end
