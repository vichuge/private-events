class Invitation < ApplicationRecord
  belongs_to :attendee, class_name: :user
  belongs_to :attended_event, class_name: :event
end
