class Venue < ApplicationRecord
  has_many :bookings
  has_many :performers, through: :bookings

  validates :name, :location, :capacity, presence: true

end
