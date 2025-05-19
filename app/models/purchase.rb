class Purchase < ApplicationRecord
  belongs_to :client
  belongs_to :product

  after_create_commit :notify_admin_on_first_purchase

  private

  def notify_admin_on_first_purchase
    if product.purchases.count == 1
      PurchaseMailer.first_purchase(product, self).deliver_later
    end
  end
end
