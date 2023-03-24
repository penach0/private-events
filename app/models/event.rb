class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"

  validates :creator_id, :name, :date, :location, :description, presence: true
  validates :date, comparison: { greater_than: Time.current }
end
