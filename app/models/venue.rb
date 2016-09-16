class Venue < ApplicationRecord
  has_many :bookings
  has_many :performers, through: :bookings

  validates :name, :location, :capacity, presence: true

  def booked?(date)
    self.bookings.where(date: date.to_datetime).present?
  end

end
