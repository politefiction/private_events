class AddAttendedEventToEventConnections < ActiveRecord::Migration[5.1]
  def change
    add_reference :event_connections, :attended_event, foreign_key: { to_table: :events }
  end
end
