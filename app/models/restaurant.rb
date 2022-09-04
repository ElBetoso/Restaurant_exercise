class Restaurant < ApplicationRecord
  has_one_attached :logo
  has_many :dish
  validates :name, presence: true 
end
