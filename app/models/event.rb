class Event < ApplicationRecord
  # looks for the foreign key name after the association (creator_id)
  belongs_to :creator, class_name: "User"
  has_many :invitations, foreign_key: :attended_event_id
  has_many :attendees, through: :invitations
end
