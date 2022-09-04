class Orderable < ApplicationRecord
  belongs_to :dish
  belongs_to :cart

  def total
  dish.price * quantity
end
end
