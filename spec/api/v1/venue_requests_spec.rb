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
      expect(response_body.first["performers"]).to eq([])
    end
  end

  describe 'get /venues/:id' do
    it 'returns a JSON object describing the first venue' do
      venue = Venue.create(name: 'Mobtown Ballroom', location: 'Baltimore', capacity: 200)
      get "/api/v1/venues/#{venue.id}"
      response_body = JSON.parse(response.body)
      expect(response).to be_success
      expect(response_body["name"]).to eq(venue.name)
    end
  end

  describe 'post /venues' do
    context 'when valid' do
      it 'creates a new venue' do
        post '/api/v1/venues', {venue: {name: 'Mobtown Ballroom', location: 'Baltimore', capacity: 200}}

        venue = Venue.first
        response_body = JSON.parse(response.body)
        expect(response).to be_success
        expect(Venue.count).to eq(1)
        expect(venue.name).to eq("Mobtown Ballroom")
        expect(venue.location).to eq("Baltimore")
        expect(venue.capacity).to eq(200)
        expect(response_body["name"]).to eq("Mobtown Ballroom")
      end
    end

    context 'when invalid' do
      it 'returns an error status and message' do
        post '/api/v1/venues', {venue: {location: 'Baltimore', capacity: 200}}

        response_body = JSON.parse(response.body)
        expect(response.status).to eq(500)
        expect(response_body).to eq({"name" => ["can't be blank"]})
      end
    end
  end

  describe 'patch /venues/:id' do
    context 'when valid' do
      it 'updates the venue' do
        Venue.create(name: 'Mobtown Ballroom', location: 'Baltimore', capacity: 200)
        patch "/api/v1/venues/1", {venue: {capacity: 300}}
        venue = Venue.first

        expect(response).to be_success
        expect(venue.name).to eq("Mobtown Ballroom")
        expect(venue.location).to eq("Baltimore")
        expect(venue.capacity).to eq(300)
      end
    end

    context 'when invalid' do
      it 'returns an error status and message' do
        Venue.create(name: 'Mobtown Ballroom', location: 'Baltimore', capacity: 200)
        patch "/api/v1/venues/1", {venue: {name: nil}}
        venue = Venue.first

        response_body = JSON.parse(response.body)
        expect(response.status).to eq(500)
        expect(response_body).to eq({"name" => ["can't be blank"]})
      end
    end

  end

  describe 'destroy /venues/:id' do

  end
end
