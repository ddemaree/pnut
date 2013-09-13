module AdminController
  extend ActiveSupport::Concern

  included do
    before_filter :require_admin_login
  end

  protected

  def require_admin_login
    unless logged_in?
      redirect_to admin_login_path and return false
    end
  end

  def current_user
    @current_user ||= User.where(id: session[:user_id]).first if session[:user_id].present?
  end

  def current_user=(user)
    session[:user_id] = user.id
    user
  end

  def logged_in?
    !!current_user
  end

end