class CreateInvitations < ActiveRecord::Migration[6.1]
  def change
    create_table :invitations do |t|
      t.integer :attendee
      t.integer :attended_event

      t.timestamps
    end
    add_index :invitations, :attendee
    add_index :invitations, :attended_event
  end
end
