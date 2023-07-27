class Category < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :categories_entities, dependent: :destroy
  has_many :entities, through: :categories_entities

  validates :name, presence: true, length: { minimum: 3, maximum: 60 }
  validates :icon, presence: true

  def self.default_icon
    'fas fa-question-circle'
  end

  def total_amount
    entities.sum(:amount)
  end
end
