class AddGrindToCartItems < ActiveRecord::Migration[7.0]
  def change
    add_column :cart_items, :grind, :string
  end
end
