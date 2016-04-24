class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.string :booking_id
      t.references :event, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps null: false
    end
  end
end
