require 'rails_helper'

RSpec.describe "Purchases API", type: :request do
  let!(:admin) { AdminUser.create!(email: "admin1@pp.com", password: "123456") }
  let!(:client) { Client.create!(name: "Juan", email: "juan@example.com") }
  let!(:product) { Product.create!(name: "Test", price: 1000, stock: 5, created_by: admin) }
  let!(:token) { JsonWebToken.encode(user_id: admin.id) }

  it "creates a purchase" do
    post "/api/v1/purchases", params: {
      purchase: { client_id: client.id, product_id: product.id }
    }, headers: { "Authorization" => "Bearer #{token}" }

    expect(response).to have_http_status(:created)
  end

  it "filters purchases" do
    get "/api/v1/purchases/filter", headers: { "Authorization" => "Bearer #{token}" }
    expect(response).to have_http_status(:ok)
  end

  it "returns purchases by granularity" do
    get "/api/v1/purchases/granularity?from_date=2024-01-01&to_date=2025-01-01&granularity=day",
      headers: { "Authorization" => "Bearer #{token}" }
    expect(response).to have_http_status(:ok)
  end
end
