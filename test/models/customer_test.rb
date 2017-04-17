require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  setup do
	@customer = customers(:one)
  end
  
  test "should be valid" do
	assert @customer.valid?
  end
  
  test "first_name should be present" do
	@customer.first_name = ""
	assert_not @customer.valid?
	@customer.first_name = "   "
	assert_not @customer.valid?
  end
  
  test "mobile_number should be numeral,non-blank and of size 10" do
	@customer.mobile_number = "098765432"
	assert_not @customer.valid?
	@customer.mobile_number = "  "
	assert_not @customer.valid?
	@customer.mobile_number = ""
	assert_not @customer.valid?
	@customer.mobile_number = "q123456789"
	assert_not @customer.valid?
	@customer.mobile_number = "123456789.0"
	assert_not @customer.valid?
  end
    
  test "email validation should accept valid addresses" do
	valid_addresses = %w[customer@example.com CUSTOMER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
	valid_addresses.each do |valid_address|
	  @customer.email = valid_address
	  assert @customer.valid?, "#{valid_address.inspect} should be valid"
	end
  end
    
  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @customer.email = invalid_address
      assert_not @customer.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end
  
  test "email address should not be empty" do
	@customer.email = ""
	assert_not @customer.valid?
	@customer.email = "   "
	assert_not @customer.valid?
  end
  
  test "email address should be unique" do
	duplicate_customer = @customer.dup
	duplicate_customer.email = @customer.email.upcase
	@customer.save
	assert_not duplicate_customer.valid?
  end
  
   test "email addresses should be saved as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @customer.email = mixed_case_email
    @customer.save
    assert_equal mixed_case_email.downcase, @customer.reload.email
  end
  
  test "password should be present (nonblank)" do
    @customer.password = @customer.password_confirmation = " " * 6
    assert_not @customer.valid?
  end
  
  test "password should have a minimum length" do
    @customer.password = @customer.password_confirmation = "a" * 5
    assert_not @customer.valid?
  end
end
