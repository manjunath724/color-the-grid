class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: :visitor

  def visitor
    pass = Faker::Internet.password
    user = User.create(email: Faker::Internet.safe_email, password: pass, password_confirmation: pass)
    sign_in user
    redirect_to root_path, notice: 'Signed in successfully.'
  end
end
