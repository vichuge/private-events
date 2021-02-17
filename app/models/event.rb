class Event < ApplicationRecord
  validates :name, :description, :location, :date, presence: true
  belongs_to :creator, class_name: 'User'
end
