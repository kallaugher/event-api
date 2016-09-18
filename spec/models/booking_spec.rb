require 'rails_helper'

RSpec.describe Booking, type: :model do

  let(:venue) {Venue.create(name: 'Mobtown Ballroom', location: 'Baltimore', capacity: 200)}

  let(:performer) {Performer.create(name: 'Taylor Swift', genre: 'Pop')}

  it 'should be valid with a date' do
    booking = Booking.new(venue_id: venue.id, performer_id: performer.id, date: '2016-09-17')

    expect(booking).to be_valid
  end

  it 'should be invalid without a date' do
    wrong_booking= Booking.new(venue_id: venue.id, performer_id: performer.id)
    wrong_booking.valid?
    expect(wrong_booking.errors[:date]).to include("can't be blank")
  end

end
