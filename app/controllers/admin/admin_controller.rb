class AdminController < ApplicationController
  before_action :require_admin

  def require_admin
    # TODO: Devise gem for users and permissioning
    unless current_user.admin?
      redirect_to root_path
    end
  end
end
