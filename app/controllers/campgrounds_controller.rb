class CampgroundsController < ApplicationController
  before_action :set_campground, only: %i[show edit update destroy]

  # GET /campgrounds or /campgrounds.json
  def index
    sorted = params['sorted']

    if sorted.blank?
      @campgrounds = Campground.all
    else
      @campgrounds = Campground.price_desc  if sorted == 'price_desc'
      @campgrounds = Campground.price_asc   if sorted == 'price_asc'
    end
  end

  # GET /campgrounds/1 or /campgrounds/1.json
  def show; end

  # GET /campgrounds/new
  def new
    @campground = Campground.new
  end

  # GET /campgrounds/1/edit
  def edit; end

  # POST /campgrounds or /campgrounds.json
  def create
    @campground = Campground.new(campground_params)

    if @campground.save
      render :show, status: :created, location: @campground
    else
      render json: @campground.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /campgrounds/1 or /campgrounds/1.json
  def update
    if @campground.update(campground_params)
      render :show, status: :ok, location: @campground
    else
      render json: @campground.errors, status: :unprocessable_entity
    end
  end

  # DELETE /campgrounds/1 or /campgrounds/1.json
  def destroy
    @campground.destroy

    head :no_content
  end

  # GET /campgrounds/avaiables or /campgrounds/avaiables.json
  def availables
    from = params.require(:from).to_date
    to = params.require(:to).to_date

    raise RangeError, "Fechas desordenadas #{from} #{to}" unless from <= to

    @campgrounds = Campground.availables(from, to)
    render :index
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_campground
    @campground = Campground.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def campground_params
    params.require(:campground).permit(:name)
  end
end
