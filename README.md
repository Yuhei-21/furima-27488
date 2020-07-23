## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, unique: true|
|mail|string|null:false, unique: true, index:true|
|first_name|string|null: false|
|family_name|string|null: false|
|first_name_kana|string|null: false|
|family_name_kana|string|null: false|
|birth_year|date|null: false|
|birth_month|date|null: false|
|birth_day|date|null: false|
|pass|string|null: false, unique: true|

### Association
- has_many :items
- has_many :comments
- has_many :sending_destinations

## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|integer|null: false|
|image|references|null: false, foreign_key: true|
|category|references|null: false, foreign_key: true|
|condition|references|null: false,foreign_key: true|
|item_explanation|references|null: false,foreign_key: true|
|preparation_day|references|null: false,foreign_key: true|
|postage_type|references|null: false,foreign_key: true|
|postage_payer|references|null: false,foreign_key: true|

### Association
- belongs_to :user
- has_many :comments
- has_many :sending_destinations

## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|comments|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item

## sending_destinations テーブル

|Column|Type|Options|
|------|----|-------|
|destination_first_name|string|null: false|
|destination_family_name|string|null: false|
|destination_first_name_kana|string|null: false|
|destination_family_name_kana|string|null: false|
|post_code|integer(7)|null: false|
|prefecture_code|integer|null: false|
|city|string|null: false|
|house_number|string|null: false|
|building_name|string||
|phone_number|integer|unique: true|

### Association
- belongs_to :user
- belongs_to :item