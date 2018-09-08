class ColorsController < ApplicationController
  # GET /render_the_palette.json
  def render_the_palette
    @colors = Color.all
    render partial: 'colors/render_the_colors'
  end

  # GET /colors/new
  def new
    @color = Color.new
  end

  # POST /colors
  def create
    @color = Color.new(color_params)

    if @color.save
      redirect_to colors_url, notice: 'Color was successfully created.'
    else
      redirect_to colors_url, alert: @color.errors.full_messages.join(', ')
    end
  end

  # GET /colors/leaderboard
  def leaderboard
    @user_squares = {}
    squares = Square.where.not(user_id: nil).group_by(&:username).sort_by{|user, squares| squares.count}.reverse.to_h
    squares.each do |user, squares|
      colors = {}
      squares.group_by{|x| x.color.hex}.sort_by{|color, squares| squares.count}.reverse.to_h.each do |k, v|
        colors["#{k}"] = v.count
      end
      @user_squares["#{user}"] = [squares.count, colors]
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def color_params
      params.require(:color).permit(:hex)
    end
end
