class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings, id: :uuid do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.belongs_to :room, type: :uuid, null: false, index: true
      t.timestamps null: false
    end
  end
end
