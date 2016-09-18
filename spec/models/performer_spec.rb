require 'rails_helper'

RSpec.describe Performer, type: :model do
  let(:performer) {Performer.new(name: 'Taylor Swift', genre: 'Pop')}

  it 'should be valid with a name and genre' do
    expect(performer).to be_valid
  end

  it 'should be invalid without a name' do
    wrong_performer = Performer.new(genre: 'Pop')
    wrong_performer.valid?
    expect(wrong_performer.errors[:name]).to include("can't be blank")
  end

end
