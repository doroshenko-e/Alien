module DeviseHelper

	def devise_error_messages!
  	flash_messages = []
	  resource.errors.full_messages.each do |message|
	  	message.to_sym
	   	text = "<script>toastr.error('#{message}');</script>"
	   	flash_messages << text.html_safe if message
	  end
	  flash_messages.join("\n").html_safe
	end

end