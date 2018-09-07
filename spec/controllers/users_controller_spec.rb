require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "POST #visitor" do
    it "visits a site" do
      expect {
        post :visitor
      }.to change(User, :count).by(1)
    end

    it "returns a success response" do
      post :visitor
      expect(response.status).to eq(200)
    end

    it "returns a success response" do
      post :visitor
      expect(response).to be_success
    end
  end
end
