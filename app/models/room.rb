class Room < ApplicationRecord
  belongs_to :user
  has_many :images

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
