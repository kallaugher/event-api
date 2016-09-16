require 'rails_helper'

describe 'Venue API' do
  describe 'get /venues' do
    it 'returns a JSON collection of all the venues' do
      Venue.create(name: 'Mobtown Ballroom', location: 'Baltimore', capacity: 200)
      Venue.create(name: 'Madison Square Garden', location: 'New York City', capacity: 30000)
      get '/api/v1/venues'
      response_body = JSON.parse(response.body)
      expect(response).to be_success
      expect(response_body.length).to eq(2)
      expect(response_body.first["performers"].to eq([]))
    end
  end

  describe 'get /venues/:id' do

  end

  describe 'post /venues' do

  end

  describe 'patch /venues/:id' do

  end

  describe 'destroy /venues/:id' do

  end
end
