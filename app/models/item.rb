class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :preparationday
  belongs_to_active_hash :postagetype
  belongs_to_active_hash :postagepayer
  has_one_attached :image

  validates_inclusion_of :price, in: 300..99999999
  # validates_inclusion_of :price, in: 300..9999999, message: 'Out of setting range'
  # validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  validates :name, :category_id, :condition_id, :preparationday_id, :postagetype_id, :postagepayer_id, :user_id, :item_explanation, :image, :price, presence: true
  validates :category_id, :condition_id, :preparationday_id, :postagetype_id, :postagepayer_id,:user_id, exclusion: { in: %w(1) }
end
