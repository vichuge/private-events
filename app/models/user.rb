class User < ApplicationRecord
  validates :name, presence: true
  validates_uniqueness_of :name

  has_many :events, foreign_key: :creator_id, class_name: 'Event'

  has_many :invitations, foreign_key: :attendee_id
  has_many :attended_events, through: :invitations
end
