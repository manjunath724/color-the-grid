module Features
  module SessionHelpers
    def sign_up_user
      visit root_path
      click_link 'Sign up'

      email = Faker::Internet.safe_email
      pass = Faker::Internet.password

      fill_in 'Email', with: email
      fill_in 'Password', with: pass
      fill_in 'Password confirmation', with: pass

      click_button 'Sign up'

      sign_out_user # Logged out to test the login workflow

      [User.find_by_email(email), pass]
    end

    def sign_in_with(user, pass)
      visit root_path

      fill_in 'Email', with: user.email
      fill_in 'Password', with: pass

      click_button 'Log in'
    end

    def visit_the_site
      visit root_path
      click_link 'Continue as a Visitor'
    end

    def sign_out_user
      click_link 'Sign out'
    end
  end
end
