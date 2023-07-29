require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category = categories(:one)
    @user = users(:one)
  end

  test 'should get index' do
    get categories_url
    assert_response :success

    # Check for server timing header
    assert_equal 'app;dur=1.0', response.headers['Server-Timing']
  end

  test 'should get new' do
    sign_in @user
    get new_category_url
    assert_response :success
  end

  test 'should create category' do
    sign_in @user
    assert_difference('Category.count') do
      post categories_url, params: { category: { name: 'Test Category' } }
    end

    assert_redirected_to categories_url
  end

  test 'should show category' do
    sign_in @user
    get category_url(@category)
    assert_response :success
  end

  test 'should get edit' do
    sign_in @user
    get edit_category_url(@category)
    assert_response :success
  end

  test 'should update category' do
    sign_in @user
    patch category_url(@category), params: { category: { name: 'Test Category' } }
    assert_redirected_to category_url(@category)
  end

  test 'should destroy category' do
    sign_in @user
    assert_difference('Category.count', -1) do
      delete category_url(@category)
    end

    assert_redirected_to categories_url
  end

  test 'should not destroy category' do
    sign_in @user
    assert_difference('Category.count', 0) do
      delete category_url(@category)
    end

    assert_redirected_to categories_url
  end
end
