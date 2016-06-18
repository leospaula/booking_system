class Room < ActiveRecord::Base
  belongs_to :hotel
  
  has_many :bookings, dependent: :destroy
  
  validates_presence_of :type_r, :quantity, :price
  
  def has_vacancy?
    self.quantity.zero? ? false : true
  end
  
  def reserve_room
    self.quantity -= 1
  end
  
  def cancel_reserve
    self.quantity += 1
  end
end
