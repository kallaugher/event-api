class VenueSerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :capacity
  has_many :performers
end
