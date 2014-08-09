class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  
  helper_method :logined?, :current_user

  def current_user
    @current_user ||= login_from_session unless defined?(@current_user)
    @current_user
  end

  def sign_in(user)
    session[:user_id] = user.id
    @current_user = user
  end

  def logined?
    !current_user.nil?
  end

  def login_from_session
    if session[:user_id].present?
      begin
        User.find session[:user_id]
      rescue
        session[:user_id] = nil
      end
    end
  end
  
end
