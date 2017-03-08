module SessionsHelper

  # Logs in the given customer.
  def log_in(customer)
	session[:customer_id] = customer.id
  end
  
  # Returns currently logged in customer(if any).
  def current_customer
	@current_customer ||= Customer.find_by(id: session[:customer_id])
  end
  
  # Returns true if the user is logged in, false otherwise .
  def logged_in?
	!current_customer.nil?
  end
  
  # Logs out the current user.
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
  
end
