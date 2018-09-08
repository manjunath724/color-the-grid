module Features
  module SessionHelpers
    # Register the user
    def sign_up_user
      visit root_path
      click_link 'Sign up'

      email = Faker::Internet.safe_email
      pass = Faker::Internet.password

      fill_in 'Email', with: email
      fill_in 'Password', with: pass
      fill_in 'Password confirmation', with: pass

      click_button 'Sign up'

      [User.find_by_email(email), pass]
    end

    # Log in user
    def sign_in_with(user, pass)
      visit root_path
      click_link 'Log In'

      fill_in 'Email', with: user.email
      fill_in 'Password', with: pass

      click_button 'Log in'
    end

    # Being visitor instead of logging in as a user
    def visit_the_site
      click_link 'Log In'
      click_link 'Continue as a Visitor'
    end

    # Sign out the logged in user
    def sign_out_user
      click_link 'Sign out'
    end

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
      square_id = Square.where(color_id: nil).sample.id
      find_by_id("square_#{square_id}").click
    end

    # Overwrite the visitor's colored square
    def overwrite_visitor_square
      square_id = Square.where('user_id IS NULL AND color_id IS NOT NULL').sample.id
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
