module Features
  module GridHelpers
    # Add a color to the palette
    def add_color_palette
      find_by_id("color_hex").click
      click_button "Add Color"
    end

    # Select a color from palette
    def pick_a_color
      color_id = Color.all.sample.id
      find_by_id("color_#{color_id}").click
    end

    # Place a color on a relevant square
    def draw_on_board
      square_id = Square.where(color_id: nil).sample.id      # May raise NoMethodError: undefined method `id' for nil:NilClass when there is no empty square available
      find_by_id("square_#{square_id}").click
    end

    # Overwrite the visitor's colored square
    def overwrite_visitor_square
      square_id = Square.where('user_id IS NULL AND color_id IS NOT NULL').sample.id      # May raise NoMethodError: undefined method `id' for nil:NilClass when there is no visitor's square
      find_by_id("square_#{square_id}").click
    end

    # Overwrite other user/visitor's colored square
    def overwrite_user_square(user_id = nil)
      square_id = Square.where.not(user_id: [nil, user_id]).sample.id
      find_by_id("square_#{square_id}").click
    end

    # User updates his/her own colored square
    def overwrite_owned_square(user_id)
      square_id = Square.where(user_id: user_id).sample.id
      find_by_id("square_#{square_id}").click
    end

    # Hover the mouse over a colored square
    def mouse_hover
      square_id = Square.where.not(color_id: nil).sample.id
      find_by_id("square_#{square_id}").hover
    end
  end
end
