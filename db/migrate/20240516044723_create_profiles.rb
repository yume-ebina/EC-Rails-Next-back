class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :email
      t.string :postal_code
      t.string :address1
      t.string :address2
      t.string :address3
      t.string :tel
      t.boolean :unsubscribe_status, default: false
      t.string :image
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
