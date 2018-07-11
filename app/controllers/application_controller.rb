class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	
	helper_method :current_user,:logged_in?
	
	def current_user
		#@current_user = User.find(session[:user_id]) if session[:user_id] The problem with this is whenever you call the method The User model
		#has to go to database to do that again and again
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end
	def logged_in?
		!!current_user#Converting current_user method return's value  into boolean true or false
	end
	def require_user
		if !logged_in?
			flash[:danger] = "You must be logged in to perform that action"
			redirect_to root_path
		end
	end
end
