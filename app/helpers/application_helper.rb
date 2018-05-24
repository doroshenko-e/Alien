module ApplicationHelper

	def avatar_url(user)
      gravatar_id = Digest::MD5::hexdigest(user.email).downcase
      "http://gravatar.com/avatar/#{gravatar_id}.png?d=identicon"
	end

	def custom_bootstrap_flash
  flash_messages = []
	  flash.each do |type, message|
	    type = 'success' if type == 'notice'
	    type = 'error'   if type == 'alert'
	    text = "<script>toastr.#{type}('#{message}');</script>"
	    flash_messages << text.html_safe if message
	  end
	  flash_messages.join("\n").html_safe
	end

end
