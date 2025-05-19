class AdminUser < ApplicationRecord
  has_secure_password
  has_many :products, foreign_key: :created_by_id
  has_many :categories, foreign_key: :created_by_id
end
