class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :attendances, foreign_key: :attended_event_id
  has_many :attendees, through: :attendances

  validates :creator_id, :name, :date, :location, :description, presence: true
  validates :date, comparison: { greater_than: Time.current }

  scope :past, -> { where("date < ?", Time.current) }
  scope :upcoming, -> { where("date >= ?", Time.current) }

  def formatted_date
    date.strftime("%d/%m/%y at %H:%M" )
  end
end
