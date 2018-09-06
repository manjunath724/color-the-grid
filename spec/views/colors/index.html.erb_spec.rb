require 'rails_helper'

RSpec.describe "colors/index", type: :view do
  before(:each) do
    assign(:colors, [
      FactoryGirl.create(:color),
      FactoryGirl.create(:color)
    ])
  end

  it "renders a list of colors" do
    render
    assert_select "tr>td", :count => 2
  end
end
