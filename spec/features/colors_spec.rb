require "rails_helper"

RSpec.feature "User Colors the Grid", type: :feature do
  before(:all) do
    @user, @pass = sign_up_user
  end

  before(:each) do |scene|
    sign_in_with(@user, @pass) unless scene.metadata[:skip_login]
  end

  after(:each) do
    sign_out_user
  end

  # Relogin has been skipped as the sign up process will log in the user
  scenario "User creates a new color", :skip_login do
    add_color_palette

    expect(page).to have_text("Color was successfully created.")
  end

  scenario "User attempts to create a duplicate color" do
    add_color_palette

    expect(page).to have_text("Hex Color has already been taken")
  end
end

RSpec.feature "Visitor Colors the Grid", type: :feature do
  scenario "Visitor creates a new color" do
    visit root_path
    add_color_palette

    expect(page).to have_text("Color was successfully created.")
  end

  scenario "Visitor attempts to create a duplicate color" do
    visit root_path
    add_color_palette

    expect(page).to have_text("Hex Color has already been taken")
  end

  scenario "Visitor continues to be a visitor" do
    visit_the_site
  end
end
