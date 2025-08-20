require "test_helper"

class BragsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get my_brags_url
    assert_response :success
  end
end
