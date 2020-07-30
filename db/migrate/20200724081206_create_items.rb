class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,                null: false
      t.integer :price,              null: false
      t.references :image,           null: false
      t.references :category,        null: false
      t.references :condition,       null: false
      t.references :preparation_day, null: false
      t.references :postage_type,    null: false
      t.references :postage_payer,   null: false
      t.text :item_explanation,      null: false
      t.integer :user_id,            null: false, foreign_key: true
      t.timestamps
    end
  end
end
