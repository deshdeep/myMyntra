class SessionsController < ApplicationController
  def new
  end
  
  def create
	customer = Customer.find_by(email: params[:session][:email].downcase)
    if customer && customer.authenticate(params[:session][:password])
      log_in customer # equivalent of customer_url(customer)
	  redirect_to customer
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end
  
  def destroy
	log_out
    redirect_to root_url
  end
end
