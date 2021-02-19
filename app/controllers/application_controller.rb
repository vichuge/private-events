class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :user_is_logged_in?

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def user_is_logged_in?
    session[:user_id]
  end
end
