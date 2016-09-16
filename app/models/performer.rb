class Performer < ApplicationRecord
  has_many :bookings
  has_many :venues, through: :bookings
end
