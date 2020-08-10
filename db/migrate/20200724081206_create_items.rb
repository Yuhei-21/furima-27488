class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,                null: false
      t.integer :price,              null: false
      t.integer :category_id,        null: false
      t.integer :condition_id,       null: false
      t.integer :preparationday_id,  null: false
      t.integer :postagetype_id,     null: false
      t.integer :postagepayer_id,    null: false
      t.text :item_explanation,      null: false
      t.integer :user_id,            null: false, foreign_key: true
      t.timestamps
    end
  end
end
