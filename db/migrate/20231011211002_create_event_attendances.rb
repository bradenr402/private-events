class CreateEventAttendances < ActiveRecord::Migration[7.0]
  def change
    create_table :event_attendances do |t|
      t.references :attendee
      t.references :attended_event

      t.timestamps
    end
  end
end
