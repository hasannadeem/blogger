require 'test_helper'

class ViewprofileControllerTest < ActionDispatch::IntegrationTest
  test "should get view" do
    get viewprofile_view_url
    assert_response :success
  end

end
