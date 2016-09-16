class Venue < ApplicationRecord
  validates :name, :location, :capacity, presence: true
end
