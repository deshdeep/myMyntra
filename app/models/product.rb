class Product < ActiveRecord::Base
	belongs_to :order
	belongs_to :cart
	belongs_to :category

	validates :brand, :name, :size, :color, presence: true
	validates :price, numericality: true, presence: true
end
