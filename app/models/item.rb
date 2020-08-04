class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :preparationday
  belongs_to_active_hash :postagetype
  belongs_to_active_hash :postagepayer
  has_one_attached :image

  validates_inclusion_of :price, in: 300..100000000
  validates :image_presence
  validates :name, :text, :category_id, :condition_id, :preparationday_id, :postagetype_id, :postagepayer_id,:user_id, presence: true
  validates :category_id, :condition_id, :preparationday_id, :postagetype_id, :postagepayer_id,:user_id, exclusion: { in: %w(1) }
end
