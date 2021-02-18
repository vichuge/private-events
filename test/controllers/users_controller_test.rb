require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test 'should get user' do
    get users_user_url
    assert_response :success
  end
end
