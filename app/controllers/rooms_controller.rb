class RoomsController < ApplicationController

  before_action :room_set, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:show]

  def index
    @rooms = current_user.rooms
  end

  def new
    @room = current_user.rooms.build
  end

  def create
    @room = current_user.rooms.build(room_params)
    if @room.save
      redirect_to @room, notice: "Saved..."
    else
      render :new
    end
  end

  

  def show
  end

  def edit

  end

  def update
    if @room.update(room_params)
      redirect_to edit_room_path(@room), notice: "Updated..."
    else
      render :edit
    end
  end

  private

  def room_set
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:home_type, :room_type, :accommodate, :bedroom, :bath_room, :listing, :summary, :address, :is_tv, :is_kitchen, :is_air, :is_heating, :is_internet, :price, :active)

  end

end
