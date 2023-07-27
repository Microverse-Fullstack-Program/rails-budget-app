require "test_helper"

class EntityTest < ActiveSupport::TestCase
  test "should not save entity without name" do
    entity = Entity.new
    assert_not entity.save
  end

  test "should not save entity with name greater than 60 characters" do
    entity = Entity.new(name: "x" * 61)
    assert_not entity.save
  end

  test "should save entity with name greater than 3 characters" do
    entity = Entity.new(name: "entity-1")
    assert entity.save
  end

  test "should not save entity without amount" do
    entity = Entity.new(name: "entity-1")
    assert_not entity.save
  end

  test "should not save entity with amount less than 0" do
    entity = Entity.new(name: "entity-1", amount: -1)
    assert_not entity.save
  end

  test "should save entity with amount greater than 0" do
    entity = Entity.new(name: "entity-1", amount: 1)
    assert entity.save
  end

  test "should not save entity without author" do
    entity = Entity.new(name: "entity-1", amount: 1)
    assert_not entity.save
  end

  test "should save entity with author" do
    user = = User.new(name: "category-1", email: "user@localhost", password: "123456")
    assert user.save
    entity = Entity.new(name: "entity-1", amount: 1, author: user)
    assert entity.save
  end
end
