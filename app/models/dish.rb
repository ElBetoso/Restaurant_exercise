class Dish < ApplicationRecord
  has_one_attached :photo

  belongs_to :dish_group
  belongs_to :restaurant
  has_many :orderables, dependent: :destroy
  has_many :carts, through: :orderables
  validates :name, :price, presence: true
end
