require "test_helper"

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get inde" do
    get user_inde_url
    assert_response :success
  end

  test "should get create" do
    get user_create_url
    assert_response :success
  end

  test "should get update" do
    get user_update_url
    assert_response :success
  end

  test "should get destroy" do
    get user_destroy_url
    assert_response :success
  end

  test "should get new" do
    get user_new_url
    assert_response :success
  end

  test "should get show" do
    get user_show_url
    assert_response :success
  end
end
