class DailyReportJob < ApplicationJob
  queue_as :default

  def perform
    report = Purchase.where(created_at: Date.yesterday.all_day)
                     .group(:product_id)
                     .count
    AdminUser.find_each do |admin|
      DailyReportMailer.report(admin, report).deliver_later
    end
  end
end
