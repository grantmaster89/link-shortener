class Admin::ShortLinksController < ApplicationController
  def index
    @short_links = ShortLink.all
  end

  # def show
  # end

  private
end
