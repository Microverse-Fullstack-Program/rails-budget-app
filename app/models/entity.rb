class Entity < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :categories_entities, dependent: :destroy
  has_many :categories , through: :categories_entities

  validates :name, presence: true, length: { minimum: 3, maximum: 60 }
  validates :amount, presence: true, numericality: { greater_than: 0 }
end
