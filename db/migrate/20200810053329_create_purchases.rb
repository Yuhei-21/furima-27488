class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.integer :user_id,            null: false, foreign_key: true
      t.integer :item_id,            null: false, foreign_key: true
      t.integer :postcode,           null: false
      t.integer :prefecturecode,     null: false
      t.string :city,                null: false
      t.string :housenumber,         null: false
      t.string :buildingname
      t.string :phonenumber,         null: false
      t.timestamps
    end
  end
end
