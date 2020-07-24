## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, unique: true|
|mail|string|null:false, unique: true, index:true|
|first_name|string|null: false|
|family_name|string|null: false|
|first_name_kana|string|null: false|
|family_name_kana|string|null: false|
|birthday|string|null: false|
|pass|string|null: false, unique: true|
|item_id|integer|null: false, foreign_key: true|

### Association
- has_many :items
- has_many :comments
- has_many :item_purchases

## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|integer|null: false|
|image|references|null: false|
|category|references|null: false|
|condition|references|null: false|
|item_explanation|text|null: false|
|preparation_day|references|null: false|
|postage_type|references|null: false|
|postage_payer|references|null: false|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- has_many :comments
- has_many :address
- has_one :item_purchase

## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|comments|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item

## address テーブル

|Column|Type|Options|
|------|----|-------|
|post_code|integer(7)|null: false|
|prefecture_code|integer|null: false|
|city|string|null: false|
|house_number|string|null: false|
|building_name|string||
|phone_number|string|null: false|
|item_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :item
- has_one :item_purchase

## item_purchases テーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|
|address_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :item
- belongs_to :user
- has_one :address