class User < ApplicationRecord
  validates :name, presence: true
  validates_uniqueness_of :name

  has_many :events, foreign_key: :creator_id, class_name: 'Event'
end
