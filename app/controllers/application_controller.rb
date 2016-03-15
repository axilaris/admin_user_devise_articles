class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


	def after_sign_in_path_for(resource)
	  if resource.is_a?(User)
	    #user_articles_path
	    user_dashboard_index_path
	  elsif resource.is_a?(Admin)
	    #admin_articles_path
	    admin_dashboard_index_path
	  end
	end  	


	def after_sign_out_path_for(resource)
	  if resource.is_a?(User)
	    new_user_session_path
	  elsif resource.is_a?(Admin)
	    new_admin_session_path
	  end
	end  	

end
