class Hotel < ActiveRecord::Base
  belongs_to :owner
  has_many :rooms, dependent: :destroy
  has_many :bookings, through: :rooms
  
  validates_presence_of :name, :description
  validates :description, length: { in: 2..200 }
  
  def available_rooms
    sum = 0
    rooms.map { |x| sum += x.quantity}
    return sum
  end
end
