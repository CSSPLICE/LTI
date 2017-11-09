require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get login," do
    get sessions_login,_url
    assert_response :success
  end

  test "should get home," do
    get sessions_home,_url
    assert_response :success
  end

  test "should get profile," do
    get sessions_profile,_url
    assert_response :success
  end

  test "should get setting" do
    get sessions_setting_url
    assert_response :success
  end

end
