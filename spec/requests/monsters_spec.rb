require 'rails_helper'

RSpec.describe "Monsters", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/monsters/show"
      expect(response).to have_http_status(:success)
    end
  end

end
