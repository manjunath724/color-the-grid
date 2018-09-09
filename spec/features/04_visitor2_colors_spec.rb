require "rails_helper"

RSpec.feature "Visitor2 Colors the Grid", type: :feature do
  before(:each) do
    visit root_path
  end

  scenario "Visitor attempts to create a duplicate color" do
    add_color_palette

    expect(page).to have_text("Hex Color has already been taken")
  end

  scenario "Visitor continues to be a visitor" do
    visit_the_site
  end

  scenario "Visitor attempts to draw without selecting the color from palette" do
    draw_on_board

    expect(page).to have_text("Please select a color from the palette to draw")
  end

  scenario "Visitor selects a color and places it on squares" do
    pick_a_color

    rand(20).times do
      draw_on_board
    end
  end

  scenario "Visitor clears the color selection and attempts to draw on board" do
    click_button 'Clear Selection'
    draw_on_board

    expect(page).to have_text("Please select a color from the palette to draw")
  end

  scenario "Visitor places random colors on random squares" do
    rand(20).times do
      pick_a_color
      draw_on_board
    end
  end

  scenario "Visitor overwrites self and other visitors squares" do
    rand(20).times do
      pick_a_color
      overwrite_visitor_square
    end
  end

  scenario "Visitor attempts to overwrite users squares" do
    rand(6).times do
      pick_a_color
      overwrite_user_square

      expect(page).to have_text("That square color can't be overwritten")
    end
  end

  scenario "Visitor hovers the mouse pointer over colored squares for more info" do
    rand(10).times do
      mouse_hover
    end
  end

  scenario "Visitor visits leader board" do
    click_link 'LeaderBoard'
  end
end
