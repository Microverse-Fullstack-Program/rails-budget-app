require 'rails_helper'

RSpec.describe Entity, type: :model do
  let (:entity) { Entity.create(name: 'entity-1', amount: 'fas fa-question-circle') }

  it 'should not save entity without name' do
    entity.name = nil
    expect(entity).to_not be_valid
  end
end
