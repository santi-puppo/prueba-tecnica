class CampsitesController < ApplicationController
  before_action :set_campsite, only: %i[show edit update destroy]

  # GET /campsites or /campsites.json
  def index
    @campsites = Campsite.all
  end

  # GET /campsites/1 or /campsites/1.json
  def show; end

  # GET /campsites/new
  def new
    @campsite = Campsite.new
  end

  # GET /campsites/1/edit
  def edit; end

  # POST /campsites or /campsites.json
  def create
    @campsite = Campsite.new(campsite_params)

    if @campsite.save
      render :show, status: :created, location: @campsite
    else
      render json: @campsite.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /campsites/1 or /campsites/1.json
  def update
    if @campsite.update(campsite_params)
      render :show, status: :ok, location: @campsite
    else
      render json: @campsite.errors, status: :unprocessable_entity
    end
  end

  # DELETE /campsites/1 or /campsites/1.json
  def destroy
    @campsite.destroy

    head :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_campsite
    @campsite = Campsite.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def campsite_params
    params.require(:campsite).permit(:name, :price)
  end
end
