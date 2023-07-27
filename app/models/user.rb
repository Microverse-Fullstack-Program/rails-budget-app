class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable

  has_many :categories, dependent: :destroy
  has_many :entities, dependent: :destroy

  validates :name, presence: true
  validates :name, length: { minimum: 3, maximum: 50 }
end
