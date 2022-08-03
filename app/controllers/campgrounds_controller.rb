class CampgroundsController < ApplicationController
  before_action :set_campground, only: %i[ show edit update destroy ]

  # GET /campgrounds or /campgrounds.json
  def index
    @campgrounds = Campground.all
  end

  # GET /campgrounds/1 or /campgrounds/1.json
  def show
  end

  # GET /campgrounds/new
  def new
    @campground = Campground.new
  end

  # GET /campgrounds/1/edit
  def edit
  end

  # POST /campgrounds or /campgrounds.json
  def create
    @campground = Campground.new(campground_params)

    respond_to do |format|
      if @campground.save
        format.html { redirect_to campground_url(@campground), notice: "Campground was successfully created." }
        format.json { render :show, status: :created, location: @campground }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @campground.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /campgrounds/1 or /campgrounds/1.json
  def update
    respond_to do |format|
      if @campground.update(campground_params)
        format.html { redirect_to campground_url(@campground), notice: "Campground was successfully updated." }
        format.json { render :show, status: :ok, location: @campground }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @campground.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /campgrounds/1 or /campgrounds/1.json
  def destroy
    @campground.destroy

    respond_to do |format|
      format.html { redirect_to campgrounds_url, notice: "Campground was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_campground
      @campground = Campground.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def campground_params
      params.require(:campground).permit(:name, :price_range)
    end
end
