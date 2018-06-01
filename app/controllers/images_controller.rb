class ImagesController < ApplicationController

	def destroy
		@photo = Image.find(param[:id])
		room = @photo.room
		@photo.destroy
		@photos = Image.where(:room_id room.id)
		respond_to :js
	end

end