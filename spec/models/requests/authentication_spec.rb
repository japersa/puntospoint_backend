require 'rails_helper'

RSpec.describe "Authentication", type: :request do
  let!(:admin) { AdminUser.create!(email: "admin1@pp.com", password: "123456") }

  it "logs in successfully" do
    post "/api/v1/auth/login", params: { email: "admin1@pp.com", password: "123456" }
    expect(response).to have_http_status(:ok)
    expect(JSON.parse(response.body)).to have_key("token")
  end

  it "fails with invalid credentials" do
    post "/api/v1/auth/login", params: { email: "admin1@pp.com", password: "wrong" }
    expect(response).to have_http_status(:unauthorized)
  end
end
