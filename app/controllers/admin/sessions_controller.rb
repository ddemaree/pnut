class Admin::SessionsController < ApplicationController
  include AdminController
  skip_before_filter :require_admin_login

  def new
  end

  def create
    set_password_in_session(params[:admin_password])
    redirect_to admin_destinations_path
  end

end
