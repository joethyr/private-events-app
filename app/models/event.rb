class Event < ApplicationRecord
  # looks for the foreign key name after the association (creator_id)
  validates :title, :description, :date, :location, presence: true
  belongs_to :creator, class_name: "User"
  has_many :invitations, foreign_key: :attended_event_id
  has_many :attendees, through: :invitations

  scope :past, -> { where('date < ?', Date.today).order(date: :desc) }
  scope :future, -> { where('date > ?', Date.today).order(:date) }
end
