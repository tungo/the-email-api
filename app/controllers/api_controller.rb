class ApiController < ApplicationController
  def index
    render plain: 'The Email API'
  end

  def send_email
    unless params[:to]
      render json: { error: 'missing parameter' }, status: 422
      return
    end

    begin
      ApiMailer.send_email(api_params).deliver_now
    rescue
      render json: { error: 'an error occurred when sending your email' }, status: 422
      return
    end

    render json: { success: 'your email has been sent' }
  end

  def api_params
    params.permit :to, :subject, :body
  end
end
