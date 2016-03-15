class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


	def after_sign_in_path_for(resource)
	  if resource.is_a?(User)
	    users_articles_path
	  elsif resource.is_a?(Admin)
	    admins_dashboard_index_path
	  end
	end  

end
