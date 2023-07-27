class CategoryEntity < ApplicationRecord
  belongs_to :category
  belongs_to :entity

  validates :category_id, presence: true
  validates :entity_id, presence: true
end
