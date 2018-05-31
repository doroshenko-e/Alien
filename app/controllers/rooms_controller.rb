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
      if params[:images]
        params[:images].each do |image|
          @room.images.create(image: image)
        end
      end
      redirect_to @room, notice: "Saved..."
    else
      render :new
    end
  end

  def show
    @images = @room.images
  end

  def edit
    if current_user == @room.user
      @images = @room.images
    else
      redirect_to root_path, notice: "You have no permitions"
    end
  end

  def update
    if @room.update(room_params)
      if params[:images]
        params[:images].each do |image|
          @room.images.create(photo: image)
        end
      end
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
