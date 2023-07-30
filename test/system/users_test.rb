require 'application_system_test_case'

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
  end

  test 'visiting the index' do
    visit new_user_session_url
    assert_selector 'p', text: 'LOG IN'
  end

  test 'should create user' do
    visit new_user_session_url
    click_on 'Sign up'

    fill_in 'Name', with: @user.name
    click_on 'Next'

    assert_text 'User was successfully created'
    click_on 'Back'
  end

  test 'should update User' do
    visit new_user_registration_url
    click_on 'Edit this user', match: :first

    fill_in 'Name', with: @user.name
    click_on 'Update User'

    assert_text 'User was successfully updated'
    click_on 'Back'
  end

  test 'should destroy User' do
    visit user_registartion_url
    click_on 'Destroy this user', match: :first

    assert_text 'User was successfully destroyed'
  end
end