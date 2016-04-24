class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :event_name
      t.string :event_type
      t.date :event_date
      t.string :event_location
      t.text :event_description

      t.timestamps null: false
    end
  end
end
