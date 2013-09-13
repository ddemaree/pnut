class Admin::SessionsController < ApplicationController
  include AdminController
  skip_before_filter :require_admin_login

  def new
  end

  def create
    if user = User.authenticate(params[:admin_email], params[:admin_password])
      self.current_user = user
    end

    redirect_to admin_destinations_path
  end

end
