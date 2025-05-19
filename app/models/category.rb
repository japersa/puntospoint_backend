class Category < ApplicationRecord
  belongs_to :created_by, class_name: 'AdminUser'
  has_and_belongs_to_many :products
end
