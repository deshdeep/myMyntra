require 'test_helper'

def setup
    @customer = customers(:one)
end

class CustomersLoginTest < ActionDispatch::IntegrationTest
  test "login with valid information" do
    get login_path
    post login_path, params: {session: {email: @customer.email,password: 'password' }}
    assert_redirected_to @customer
    follow_redirect!
    assert_select "a[href=?]", login_path, count: 0 #no login available
    assert_select "a[href=?]", logout_path			#logout is available
    assert_select "a[href=?]", customer_path(@customer) # show customer
	assert_select "a[href=?]", root_path, count: 2   # root path 
	assert_select "a[href=?]", customers_path, count: 2 # all customers index
	assert_select "a[href=?]", edit_customer_path(@customer), count: 2 # edit
  end
end
