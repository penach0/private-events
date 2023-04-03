class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :created_events, foreign_key: "creator_id", class_name: "Event"
  has_many :attendances, foreign_key: :attendee_id
  has_many :attended_events, through: :attendances

  validates :username, presence: true

  scope :attending, ->(event) { joins(:attendances).where("attended_event_id = ?", event.id) }

  def attending?(event)
    attended_events.include?(event)
  end
end
