class ProductsController < ApplicationController
	def index
		@products = Product.all
	end
	
	def show
		@product = Product.find(params[:id])
	end
	
	def new
		@product = Product.new
	end
	
	def edit
		@product = Product.find(params[:id])
	end
	
	def create
		@product = Product.new(product_params)
		
		if @product.save
			redirect_to @product
		else
			render 'new'
		end
	end
	
	def update 
		@product = Product.find(:id)
		
		if @product.update(product_params)
			redirect_to @product
		else
			render 'edit'
		end
	end
	
private
		def product_params
			params.require(:product).permit(:name,:brand,:price,:size,:category) 
		end
end