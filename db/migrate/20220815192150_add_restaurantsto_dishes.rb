class AddRestaurantstoDishes < ActiveRecord::Migration[7.0]
  def change
      add_reference :dishes, :restaurant, null: false, foreing_key: true
  end
end
