class AddGrindToCartItems < ActiveRecord::Migration[7.0]
  def change
    add_column :cart_items, :grind, :integer
  end
end
