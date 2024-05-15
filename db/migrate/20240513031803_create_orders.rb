class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :shipping_name, null: false
      t.string :postal_code, null: false
      t.string :address1, null: false
      t.string :address2, null: false
      t.string :address3
      t.string :shipping_tel, null: false
      t.integer :postage, null: false
      t.integer :billing_amount, null: false
      t.integer :status, null: false, default: 0
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
