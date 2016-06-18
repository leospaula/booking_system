class Admin::HotelsController < Admin::AdminController
  before_action :set_hotel, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @hotels = current_owner.hotels
    respond_with(:admin, @hotels)
  end

  def show
    respond_with(:admin, @hotel)
  end

  def new
    @hotel = current_owner.hotels.build
    respond_with(:admin, @hotel)
  end

  def edit
  end

  def create
    @hotel = current_owner.hotels.build(hotel_params)
    @hotel.save
    respond_with(:admin, @hotel)
  end

  def update
    @hotel.update(hotel_params)
    respond_with(:admin, @hotel)
  end

  def destroy
    @hotel.destroy
    respond_with(:admin, @hotel)
  end

  private
    def set_hotel
      @hotel = Hotel.find(params[:id])
    end

    def hotel_params
      params.require(:hotel).permit :name, :description, :owner_id
    end
end
