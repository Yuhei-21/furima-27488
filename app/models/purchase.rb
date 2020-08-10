class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :item

  validates :postcode, :prefecturecode, :city, :housenumber, :phonenumber, presence: true

end
