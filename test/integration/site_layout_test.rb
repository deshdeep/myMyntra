require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test "layout_links" do
	get root_path
	assert_select "a[href=?]", root_path, count: 2
  end
end
