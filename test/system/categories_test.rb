require 'application_system_test_case'

class CategoriesTest < ApplicationSystemTestCase
  setup do
    @category = categories(:one)
  end

  test 'visiting the index' do
    visit categories_url
    assert_selector 'h2', text: 'CARTEGORIES'
  end

  test 'should create category' do
    visit categories_url
    click_on 'Add Category'

    fill_in 'Icon', with: @category.icon
    fill_in 'Name', with: @category.name
    click_on 'Save'

    assert_text 'Category was successfully created.'
    click_on 'Back'
  end
end
