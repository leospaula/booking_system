class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update]

  respond_to :html

  def index
    @bookings = Booking.all
    respond_with(@bookings)
  end

  def show
    respond_with(@booking)
  end

  def new
    @booking = Booking.new
    respond_with(@booking)
  end

  def edit
  end

#  def create
#    @booking = Booking.new(booking_params)
#    @booking.room_id ||= params[:room_id]
#    binding.pry
#    @booking.save
#    respond_with(@booking)
#  end

  def create
    service = BookingService.new(params[:booking][:room_id], params[:booking][:start_time], params[:booking][:end_time])
    begin
      service.reserve!
      flash[:success] = "You are booked!" 
      redirect_to root_url
    rescue RoomNotAvailableException
      flash[:error] = "error" 
      redirect_to bookings_url
    end
  end

  def update
    @booking.update(booking_params)
    respond_with(@booking)
  end

  def destroy
    service = RemoveBookingService.new(params[:id])
    begin
      service.cancel_reserve!
      flash[:success] = "Booking was removed" 
      redirect_to bookings_url
    rescue BookingNotExistException
      flash[:error] = "error" 
      redirect_to bookings_url
    end
  end

  private
    def set_booking
      @booking = Booking.find(params[:id])
    end

    def booking_params
      params.require(:booking).permit :start_time, :end_time, :room_id
    end
end
