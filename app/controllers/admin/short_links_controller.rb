class Admin::ShortLinksController < ApplicationController
  #TODO: Refactor this to inherit from AdminController to require admin role
  # i.g. Admin::CategoriesController < AdminController
  def index
    @short_links = ShortLink.all
  end

  def show
    fetch_short_link
  end

  def toggle_active_status
    fetch_short_link
    @short_link.toggle!(:active)
  end

  private

  def fetch_short_link
    @short_link = ShortLink.find_by_slug(params[:id])
  end
end
