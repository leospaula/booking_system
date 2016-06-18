class BookingNotExistException < StandardError; end

class RemoveBookingService
  def initialize(booking_id)
    @booking_id = booking_id
  end

  def cancel_reserve!
    ActiveRecord::Base.transaction do
      if booking_exist?
        @booking = Booking.find @booking_id
        room = @booking.room
        @booking.destroy
        room.update(quantity: room.cancel_reserve)
      else
        raise BookingNotExistException
      end
    end
  end
  
  private

  def booking_exist?
    Booking.where(:id => @booking_id).exists?
  end

end