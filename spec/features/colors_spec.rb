require "rails_helper"

RSpec.feature "User Colors the Grid", type: :feature do
  before(:all) do
    @user, @pass = sign_up_user
  end

  before(:each) do
    sign_in_with @user, @pass
  end

  after(:each) do
    sign_out_user
  end

  scenario "User creates a new color" do
    click_link 'Add Color'

    find_by_id("color_hex").click
    click_button "Create Color"

    expect(page).to have_text("Color was successfully created.")
  end

  scenario "User attempts to create a duplicate color" do
    click_link 'Add Color'

    find_by_id("color_hex").click
    click_button "Create Color"

    expect(page).to have_text("Hex Color has already been taken")
  end
end

RSpec.feature "Visitor Colors the Grid", type: :feature do
  before(:each) do
    visit_the_site
  end

  after(:each) do
    sign_out_user
  end

  scenario "Visitor creates a new color" do
    click_link 'Add Color'

    find_by_id("color_hex").click
    click_button "Create Color"

    expect(page).to have_text("Color was successfully created.")
  end

  scenario "Visitor attempts to create a duplicate color" do
    click_link 'Add Color'

    find_by_id("color_hex").click
    click_button "Create Color"

    expect(page).to have_text("Hex Color has already been taken")
  end
end
