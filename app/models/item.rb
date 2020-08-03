class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :preparationday
  belongs_to_active_hash :postagetype
  belongs_to_active_hash :postagepayer
  has_one_attached :image

  validates_inclusion_of :price, in: 300..100000000
end
