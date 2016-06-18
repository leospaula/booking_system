class Booking < ActiveRecord::Base
  belongs_to :room
  
  validate :start_time_cannot_be_in_the_past
	validate :start_time_cannot_be_greater_than_end_time
  
  def hotel_name
    room.hotel.name
  end
  
  def start_time_cannot_be_in_the_past
    if start_time.present? && start_time < Date.today
      errors.add(:start_time, "can't be in the past")
    end
  end

  def start_time_cannot_be_greater_than_end_time
    if start_time.present? && start_time > end_time
      errors.add(:start_time, "can't be greater than end date")
    end
  end
  
end
