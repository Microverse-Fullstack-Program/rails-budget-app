require 'test_helper'

class CategoryEntityTest < ActiveSupport::TestCase
  test 'should not save category entity without category' do
    category_entity = CategoryEntity.new
    assert_not category_entity.save
  end

  test 'should not save category entity without entity' do
    category_entity = CategoryEntity.new
    assert_not category_entity.save
  end

  test 'should save category entity with category and entity' do
    category = Category.new(name: 'category-1', icon: 'fas fa-question-circle')
    assert category.save
    entity = Entity.new(name: 'entity-1', amount: 1)
    assert entity.save
    category_entity = CategoryEntity.new(category:, entity:)
    assert category_entity.save
  end

  test 'should not save category entity with category and entity already exists' do
    category = Category.new(name: 'category-1', icon: 'fas fa-question-circle')
    assert category.save
    entity = Entity.new(name: 'entity-1', amount: 1)
    assert entity.save
    category_entity = CategoryEntity.new(category:, entity:)
    assert category_entity.save
    category_entity = CategoryEntity.new(category:, entity:)
    assert_not category_entity.save
  end
end
