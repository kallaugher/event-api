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
    performer = Performer.create(name: 'Taylor Swift', genre: 'Pop')
    venue.save
    Booking.new(venue_id: venue.id, performer_id: performer.id, date: 2016-09-17)
    expect(venue.booked?(date)).to eq(true)
  end
  it 'should know all the performers that it has booked'

end
