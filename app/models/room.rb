class Room < ApplicationRecord
  belongs_to :user
  has_many :images
  has_many :reservations

  geocoded_by :address
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }

  validates :home_type, presence: true
  validates :room_type, presence: true
  validates :accommodate, presence: true
  validates :bedroom, presence: true
  validates :bath_room, presence: true
  validates :listing, presence: true, length: {maximum: 50}
  validates :price, presence: true
  validates :summary, presence: true, length: {maximum: 500}
  validates :address, presence: true

end
