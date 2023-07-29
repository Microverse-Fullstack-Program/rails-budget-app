require 'test_helper'

class EntitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @entity = entities(:one)
    @user = users(:one)
    @category = categories(:one)
  end

  test 'should get index' do
    get entities_url
    assert_response :success

    # Check for server timing header
    assert_equal 'app;dur=1.0', response.headers['Server-Timing']
  end

  test 'should get new' do
    sign_in @user
    get new_category_entity_url(@category)
    assert_response :success
  end

  test 'should create entity' do
    sign_in @user
    assert_difference('Entity.count') do
      post category_entities_url, params: { entity: { name: 'Test Entity', amount: 349 } }
    end

    assert_redirected_to entities_url
  end

  test 'should show entity' do
    sign_in @user
    get category_entity_url(@entity)
    assert_response :success
  end

  test 'should get edit' do
    sign_in @user
    get edit_category_entity_url(@entity)
    assert_response :success
  end

  test 'should update entity' do
    sign_in @user
    patch category_entity_url(@entity), params: { entity: { name: 'Test Entity' } }
    assert_redirected_to entity_url(@entity)
  end

  test 'should destroy entity' do
    sign_in @user
    assert_difference('Entity.count', -1) do
      delete category_entity_url(@entity)
    end

    assert_redirected_to entities_url
  end

  test 'should not destroy entity' do
    sign_in @user
    assert_difference('Entity.count', 0) do
      delete category_entity_url(@entity)
    end

    assert_redirected_to entities_url
  end

end
