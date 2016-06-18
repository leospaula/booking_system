class RoomNotAvailableException < StandardError; end

class BookingService
  def initialize(room, arrival, departure)
    @room = room
    @arrival = arrival
    @departure = departure
  end

  def reserve!
    ActiveRecord::Base.transaction do
      if !room_available?
        room = Room.find @room
        room.bookings.create(:start_time => @arrival, :end_time => @departure)
        room.update(quantity: room.reserve_room)
      else
        raise RoomNotAvailableException
      end
    end
  end
  
  private

  def room_available?
    Booking.where(:room_id => @room, :start_time => @arrival, :end_time => @departure).exists?
  end

end