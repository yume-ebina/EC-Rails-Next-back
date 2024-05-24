class AddOrderProductToNames < ActiveRecord::Migration[7.0]
  def change
    add_column :order_products, :name, :string, null: false
  end
end
