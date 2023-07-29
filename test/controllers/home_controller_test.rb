require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test 'should get index' do
    sign_in @user
    get root_url
    assert_response :success

    # Check for server timing header
    assert_equal 'app;dur=1.0', response.headers['Server-Timing']
  end

  test 'should get new' do
    get new_user_session_url
    assert_response :success
  end

  test 'should create user session' do
    post user_session_url, params: { user: { email: 'admin@localhost', password: 'password' } }
    assert_redirected_to root_url
  end

  test 'should show user' do
    sign_in @user
    get user_url(@user)
    assert_response :success
  end

  test 'should get edit' do
    sign_in @user
    get edit_user_url(@user)
    assert_response :success
  end

  test 'should update user' do
    sign_in @user
    patch user_url(@user), params: { user: { email: 'admin@localhost' } }
    assert_redirected_to user_url(@user)
  end

  test 'should destroy user' do
    sign_in @user
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end

    assert_redirected_to root_url
  end

  test 'should not destroy user' do
    sign_in @user
    assert_no_difference('User.count') do
      delete user_url(@user)
    end

    assert_redirected_to root_url
  end
end
