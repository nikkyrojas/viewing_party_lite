class ApplicationController < ActionController::Base
 helper_method :current_user, :current_admin

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  def require_user
    if !current_user
      redirect_to "/"
      flash[:alert] = 'You must be logged in'
    end
  end

   def current_admin
    # binding.pry
    # User.find(session[:user_id]) if session[:user_id]
  end


end
