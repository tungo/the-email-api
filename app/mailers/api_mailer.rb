class ApiMailer < ApplicationMailer

  def send_email(message)
    @message = message
    mail(to: @message[:to], subject: @message[:subject])
  end
end
