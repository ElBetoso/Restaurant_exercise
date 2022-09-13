require "test_helper"

class Authentication::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference("User.count") do
      post users_url, params: { user: { email: 'elbetoso01@gmail.com', username: 'elbetoso', password: 'beto4420'} }
    end

    assert_redirected_to restaurants_url
  end
end
