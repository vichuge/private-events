class Event < ApplicationRecord
  validates :name, :description, :location, :date, presence: true
  belongs_to :creator, class_name: 'User'

  has_many :invitations, foreign_key: :attended_event_id
  has_many :attendees, through: :invitations, source: :attendee
end
