class ApiController < ApplicationController
  def index
    render plain: 'The Email API'
  end

  def send_email
    # check "to" param
    unless params[:to]
      render json: { error: 'missing parameter' }, status: 422
      return
    end

    # handle send email error
    begin
      ApiMailer.send_email(api_params).deliver_now
    rescue
      render json: { error: 'an error occurred when sending your email' }, status: 500
      return
    end

    render json: { success: 'your email has been sent' }
  end

  # params helper
  def api_params
    params.permit :to, :subject, :body
  end
end
