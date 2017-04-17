require 'test_helper'

class CustomersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
	get new_customer_path
	assert_no_difference 'Customer.count' do
	  post customers_path, customer: {first_name: "",
									  email: "invalid@lolz.com",
									  mobile_number: "123",
									  password: "foo",
									  password_confirmation: "bar"}
    end
	
	#"assert_template has been extracted to a gem. To continue using it,
    #add `gem 'rails-controller-testing'` to your Gemfile."
	#assert_template 'customers/new'
	
  end
 
  test "valid signup information" do
    get new_customer_path
    assert_difference 'Customer.count', 1 do
      post customers_path,  customer: {first_name: "desh3",
									   last_name: "deep3", 
									   email: "deshdeep3@gmail.com",
									   mobile_number: 1234657890,
									   password: "password",
									   password_confirmation: "password"}
    end
  end
  
end
