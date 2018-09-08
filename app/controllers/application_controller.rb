class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :set_user_session

  # Sets the user session for visitors and revokes upon login
  def set_user_session
    if signed_in? || devise_controller?
      session[:current_user] = nil
    else
      session[:current_user] = Faker::Internet.username
    end
  end
end
