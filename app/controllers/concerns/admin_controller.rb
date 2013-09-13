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

  def logged_in?
    password_from_config.present? && password_from_session.present? && password_from_session == password_from_config
  end

  def password_from_config
    ENV['ADMIN_PASSWORD']
  end

  def password_from_session
    session[:admin_password]
  end

  def set_password_in_session(new_password)
    session[:admin_password] = new_password
  end

end