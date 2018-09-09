require "rails_helper"

RSpec.feature "User1 Colors the Grid", type: :feature do
  before(:all) do
    @user, @pass = sign_up_user

    # Change the default color(Black) for multiple runs of Rspec test cases
    Color.where(hex: "#000000").update_all(hex: Faker::Color.hex_color)
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

  scenario "User attempts to draw without selecting the color from palette" do
    draw_on_board

    expect(page).to have_text("Please select a color from the palette to draw")
  end

  scenario "User selects a color and places it on squares" do
    pick_a_color

    rand(20).times do
      draw_on_board
    end
  end

  scenario "User clears the color selection and attempts to draw on board" do
    click_button 'Clear Selection'
    draw_on_board

    expect(page).to have_text("Please select a color from the palette to draw")
  end

  scenario "User places random colors on random squares" do
    rand(20).times do
      pick_a_color
      draw_on_board
    end
  end

  scenario "User overwrites self owned squares" do
    rand(6).times do
      pick_a_color
      overwrite_owned_square @user.id
    end
  end

  scenario "User hovers the mouse pointer over colored squares for more info" do
    rand(10).times do
      mouse_hover
    end
  end

  scenario "User visits leader board" do
    click_link 'LeaderBoard'
  end
end
