class ColorsController < ApplicationController
  # GET /colors
  # GET /colors.json
  def index
    @colors = Color.all
  end

  # GET /colors/new
  def new
    @color = Color.new
  end

  # POST /colors
  # POST /colors.json
  def create
    @color = Color.new(color_params)

    respond_to do |format|
      if @color.save
        format.html { redirect_to colors_url, notice: 'Color was successfully created.' }
        format.json { render :show, status: :created, location: @color }
      else
        format.html { render :new }
        format.json { render json: @color.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def color_params
      params.require(:color).permit(:hex)
    end
end
