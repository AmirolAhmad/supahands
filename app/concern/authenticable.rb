module Authenticable
  extend ActiveSupport::Concern
  included do
    helper_method :require_normal_user, :require_agent, :require_user, :store_location, :redirect_back_or_default, :get_redirect_back_or_default
  end

  private

  def require_normal_user
    unless current_user.try(:user?)
      flash.notice = "User permissions required to access this page."
      redirect_to dashboard_path
    end
  end

  def require_agent
    unless current_user.try(:agent?)
      flash.notice = "Agent permissions required to access this page."
      redirect_to dashboard_path
    end
  end

  def require_user
    unless current_user
      store_location
      flash[:alert] = "You must be logged in to view this page."
      redirect_to login_url
      return false
    end
  end

  def store_location
    session[:return_to] = request.original_url rescue nil
  end

  def redirect_back_or_default(default)
    redirect_to (session[:return_to] || default)
    session[:return_to] = nil
  end

  def get_redirect_back_or_default(default)
    redirect = session[:return_to] ? session[:return_to] : default
  end
end
