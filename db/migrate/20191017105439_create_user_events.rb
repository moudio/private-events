class CreateUserEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :user_events do |t|
      t.integer :attendee_id
      t.integer :attended_event_id
      t.timestamps
    end
  end
end
