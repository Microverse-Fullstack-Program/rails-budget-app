class User < ApplicationRecord
  has_many :categories, dependent: :destroy
  has_many :entities, dependent: :destroy

  validates :name, presence: true
end
