class Product < ApplicationRecord
  belongs_to :created_by, class_name: 'AdminUser'
  has_many :product_images
  has_and_belongs_to_many :categories
  has_many :purchases
end
