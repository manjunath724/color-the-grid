require "rails_helper"

RSpec.feature "Color management", type: :feature do
  scenario "User creates a new color" do
    visit "/colors/new"

    find_by_id("color_hex").click
    click_button "Create Color"

    expect(page).to have_text("Color was successfully created.")
  end

  scenario "User attempts to create a duplicate color" do
    visit "/colors/new"

    find_by_id("color_hex").click
    click_button "Create Color"

    expect(page).to have_text("Hex Color has already been taken")
  end
end
