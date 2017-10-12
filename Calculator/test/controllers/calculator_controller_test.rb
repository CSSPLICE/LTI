require 'test_helper'

class CalculatorControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get calculator_index_url
    assert_response :success
  end

end
