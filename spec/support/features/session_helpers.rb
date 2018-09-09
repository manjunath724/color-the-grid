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
  end
end
