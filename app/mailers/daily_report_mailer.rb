class DailyReportMailer < ApplicationMailer
  def report(admin, report_data)
    @admin = admin
    @report_data = report_data
    mail(to: admin.email, subject: "Reporte diario de compras")
  end
end
