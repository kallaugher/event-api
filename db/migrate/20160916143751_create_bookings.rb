class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.belongs_to :venue, foreign_key: true
      t.belongs_to :performer, foreign_key: true
      t.datetime :date

      t.timestamps
    end
  end
end
