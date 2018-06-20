class ImagesController < ApplicationController

	def destroy
		@photo = Image.find(params[:id])
		room = @photo.room
		@photo.destroy

		respond_to do |format|
			format.html {redirect_to edit_room_path(room)}
			format.js {render layout: false }
		end
	end

end