class Room < ApplicationRecord
  belongs_to :user

  validates :home_type, pesence: true
  validates :room_type, pesence: true
  validates :accommodate, pesence: true
  validates :bedroom, pesence: true
  validates :bath_room, pesence: true
  validates :listing, pesence: true, length: {maximum: 50}
  validates :price, pesence: true
  validates :summary, pesence: true, length: {maximum: 500}
  validates :address, pesence: true

end
