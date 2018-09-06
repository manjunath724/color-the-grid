require "rails_helper"

RSpec.describe ColorsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/colors").to route_to("colors#index")
    end

    it "routes to #new" do
      expect(:get => "/colors/new").to route_to("colors#new")
    end

    it "routes to #create" do
      expect(:post => "/colors").to route_to("colors#create")
    end

  end
end
