class Room < ActiveRecord::Base
  belongs_to :hotel
  
  validates_presence_of :type_r, :quantity, :price
  
  def has_vacancy?
    self.quantity.zero? ? false : true
  end
  
  def booking
    self.quantity -= 1
  end
  
  def cancel_booking
    self.quantity += 1
  end
end
