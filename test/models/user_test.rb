require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "should not save user without name" do
    user = User.new
    assert_not user.save
  end

  test "should not save user with name less than 3 characters" do
    user = User.new(name: "ab")
    assert_not user.save
  end

  test "should not save user with name greater than 50 characters" do
    user = User.new(name: "a" * 51)
    assert_not user.save
  end

  test "should save user with name greater than 3 characters" do
    user = User.new(name: "abc")
    assert user.save
  end

  test "should not save user without email" do
    user = User.new(name: "abc")
    assert_not user.save
  end

  test "should not save user with invalid email" do
    user = User.new(name: "abc", email: "abc")
    assert_not user.save
  end

  test "should save user with valid email" do
    user = User.new(name: "abc", email: "admin@localhost"
    assert user.save
  end
end
