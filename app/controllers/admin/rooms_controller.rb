class Admin::RoomsController < Admin::AdminController
  before_action :set_room, only: [:show, :edit, :update, :destroy]
  before_action :set_hotel, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  respond_to :html

  def index
    @rooms = @hotel.rooms
    respond_with(:admin, @hotel, @rooms)
  end

  def show
    respond_with(:admin, @hotel, @room)
  end

  def new
    @room = @hotel.rooms.build
    respond_with(:admin, @hotel, @room)
  end

  def edit
  end

  def create
    @room = @hotel.rooms.build(room_params)
    @room.save
    respond_with(:admin, @hotel, @room)
  end

  def update
    @room.update(room_params)
    respond_with(:admin, @hotel, @room)
  end

  def destroy
    @room.destroy
    respond_with(:admin, @hotel, @room)
  end

  private
    def set_room
      @room = Room.find(params[:id])
    end
    
    def set_hotel
      @hotel = Hotel.find(params[:hotel_id])
    end

    def room_params
      params.require(:room).permit :type_r, :quantity, :price, :hotel_id
    end
end
