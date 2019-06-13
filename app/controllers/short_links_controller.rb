class ShortLinksController < ApplicationController
  before_action :fetch_short_link, only: [:index, :show, :edit, :update]

  def index
    @short_links = ShortLink.all
  end

  def new
    @short_link = ShortLink.new
  end

  def create
    @short_link = ShortLink.new(short_link_params)
    respond_to do |format|
      if @short_link.save
        format.html { redirect_to @short_link, notice: "shortened_url was successfully created." }
        format.json { render :show, status: :created, location: @short_link }
      else
        format.html { render :new }
        format.json { render json: @short_link.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    fetch_short_link
    @short_link.increase_visit
  end

  def edit
  end

  def update
    # TODO: change this to be funtional
    if @short_link.update whatdoes: :this_do
      redirect_to :somewhere
    else
      redirect_to :somewhere_else
    end
  end

  private

  def fetch_short_link
    @short_link = ShortLink.find_by_slug(params[:id])
  end

  def short_link_params
    params.require(:short_link).permit(:original_url)
  end
end
