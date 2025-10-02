require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get root_url  # home_index_url → root_url に変更
    assert_response :success
  end
end
