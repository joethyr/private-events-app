class Event < ApplicationRecord
  # looks for the foreign key name after the association (creator_id)
  belongs_to :creator, class_name: "User"
end
