class CategoryEntity < ApplicationRecord
  belongs_to :category foreign_key :category_id
  belongs_to :entity foreign_key :entity_id

  validates :category_id, presence: true
  validates :entity_id, presence: true
end
