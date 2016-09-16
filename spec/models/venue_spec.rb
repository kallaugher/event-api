require 'rails_helper'

RSpec.describe Venue, type: :model do

  let(:venue) {Venue.new(name: 'Mobtown Ballroom', location: 'Baltimore', capacity: 200)}


  it 'should be valid with a name, location, and capacity' do
    expect(venue).to be_valid
  end

  it 'should be invalid without a name' do
    wrong_venue = Venue.new(location: 'Baltimore', capacity: 200)
    wrong_venue.valid?
    expect(wrong_venue.errors[:name]).to include("can't be blank")
  end

  it 'should be invalid without a location' do
    wrong_venue = Venue.new(name: 'Mobtown Ballroom', capacity: 200)
    wrong_venue.valid?
    expect(wrong_venue.errors[:location]).to include("can't be blank")
  end

  it 'should be invalid without a capacity' do
    wrong_venue = Venue.new(name: 'Mobtown Ballroom', location: 'Baltimore')
    wrong_venue.valid?
    expect(wrong_venue.errors[:capacity]).to include("can't be blank")
  end

  it 'should know whether it is booked for a specific date' do
    venue.save
    performer = Performer.create(name: 'Taylor Swift', genre: 'Pop')
    Booking.create(venue_id: venue.id, performer_id: performer.id, date: '2016-09-17')
    expect(venue.booked?('2016-09-17')).to eq(true)
  end

  it 'should know all the performers that it has booked' do
    venue.save
    performer1 = Performer.create(name: 'Taylor Swift', genre: 'Pop')
    Booking.create(venue_id: venue.id, performer_id: performer1.id, date: '2016-09-17')
    performer2 = Performer.create(name: 'Chance the Rapper', genre: 'Hip Hop')
    Booking.create(venue_id: venue.id, performer_id: performer2.id, date: '2016-09-20')

    expect(venue.bookings.length).to eq(2)
  end

end
