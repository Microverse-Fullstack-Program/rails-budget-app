require 'application_system_test_case'

class EntitiesTest < ApplicationSystemTestCase
  setup do
    @entity = entities(:one)
  end

  test 'visiting the index' do
    visit category_entities_url(@entity.category_id)
    assert_selector 'h2', text: 'Transactions'
  end

  test 'should create entity' do
    visit entities_url
    click_on 'New Transaction'

    fill_in 'Amount', with: @entity.amount
    fill_in 'Name', with: @entity.name
    click_on 'Save'

    assert_text 'Transaction was successfully created.'
    click_on 'Back'
  end
end