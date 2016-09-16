class CreateVenuePerformers < ActiveRecord::Migration[5.0]
  def change
    create_table :venue_performers do |t|
      t.belongs_to :venue, foreign_key: true
      t.belongs_to :performer, foreign_key: true

      t.timestamps
    end
  end
end
