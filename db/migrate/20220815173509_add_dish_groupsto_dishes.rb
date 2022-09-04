class AddDishGroupstoDishes < ActiveRecord::Migration[7.0]
  def change
    add_reference :dishes, :dish_group, null: false, foreing_key: true
  end
end
