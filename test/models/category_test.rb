require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  test "should not save category without name" do
    category = Category.new
    assert_not category.save
  end

  test "should not save category with name less than 3 characters" do
    category = Category.new(name: "ab")
    assert_not category.save
  end

  test "should not save category with name greater than 50 characters" do
    category = Category.new(name: "a" * 61)
    assert_not category.save
  end

  test "should save category with name greater than 3 characters" do
    category = Category.new(name: "category-1")
    assert category.save
  end

  test "should not save category without icon" do
    category = Category.new(name: "category-1")
    assert_not category.save
  end

  test "should not save category with invalid icon" do
    category = Category.new(name: "category-1", icon: "category-1")
    assert_not category.save
  end

  test "should save category with valid icon" do
    category = Category.new(name: "category-1", icon: "fas fa-question-circle")
    assert category.save
  end

  test "should not save category without author" do
    category = Category.new(name: "category-1", icon: "fas fa-question-circle")
    assert_not category.save
  end

  test "should save category with author" do
    user = User.new(name: "category-1", email: "user@localhost", password: "123456")
    assert user.save
    category = Category.new(name: "category-1", icon: "fas fa-question-circle", author: user)
    assert category.save
  end
end
