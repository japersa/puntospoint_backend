class ApplicationController < ActionController::API
  def authorize_request
    header = request.headers['Authorization']
    header = header.split.last if header
    begin
      decoded = JsonWebToken.decode(header)
      @current_user = AdminUser.find(decoded[:user_id])
    rescue ActiveRecord::RecordNotFound, JWT::DecodeError
      render json: { errors: 'Unauthorized' }, status: :unauthorized
    end
  end
end
