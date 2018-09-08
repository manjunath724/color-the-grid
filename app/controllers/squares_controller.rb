class SquaresController < ApplicationController
  before_action :set_square, only: :update

  # GET /square.json
  def index
    @squares = Square.first(400).each_slice(20).to_a
    render partial: 'squares/render_the_squares'
  end

  # PATCH/PUT /squares/1.json
  def update
    if @square.can_be_colored? || @square.is_owned_by?(params[:user_id].to_i)
      if @square.update(square_params)
        render json: { color: @square.color.hex, updated_at: @square.updated_at.strftime("%d/%m/%Y - %I:%M %p") }
      else
        render json: { errors: @square.errors.full_messages.join(', ') }
      end
    else
      render json: { errors: 'That square color can\'t be overwritten' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_square
      @square = Square.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def square_params
      params.permit(:color_id, :user_id, :username)
    end
end
