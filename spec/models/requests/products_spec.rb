require 'rails_helper'

RSpec.describe "Products API", type: :request do
  let!(:admin) { AdminUser.create!(email: "admin1@pp.com", password: "123456") }
  let!(:token) { JsonWebToken.encode(user_id: admin.id) }

  it "returns most purchased products" do
    get "/api/v1/products/most_purchased", headers: { "Authorization" => "Bearer #{token}" }
    expect(response).to have_http_status(:ok)
  end

  it "returns top revenue products" do
    get "/api/v1/products/top_revenue", headers: { "Authorization" => "Bearer #{token}" }
    expect(response).to have_http_status(:ok)
  end
end
