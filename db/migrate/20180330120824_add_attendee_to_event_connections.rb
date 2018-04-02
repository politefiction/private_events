class AddAttendeeToEventConnections < ActiveRecord::Migration[5.1]
  def change
    add_reference :event_connections, :attendee, foreign_key: { to_table: :users }
  end
end
