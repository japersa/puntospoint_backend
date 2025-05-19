class PurchaseMailer < ApplicationMailer
  def first_purchase(product, purchase)
    @product = product
    @purchase = purchase
    mail(
      to: product.created_by.email,
      cc: AdminUser.where.not(id: product.created_by_id).pluck(:email),
      subject: "Primera compra del producto #{product.name}"
    )
  end
end
