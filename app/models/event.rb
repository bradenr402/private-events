class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  validates :title, :datetime, presence: true

  has_many :event_attendances, foreign_key: :attended_event_id
  has_many :attendees, through: :event_attendances, source: :attendee
end
