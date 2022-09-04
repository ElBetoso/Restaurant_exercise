class AddRestaurantstoDishes < ActiveRecord::Migration[7.0]
  def change
      add_reference :dishes, :restaurant, foreing_key: true
  end
end
