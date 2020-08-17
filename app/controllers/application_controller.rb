class ApplicationController < ActionController::API
  before_action :update_allowed_parameters, if: :devise_controller?
  respond_to :json
  SECRET_KEY = Rails.application.secrets.secret_key_base.to_s

  def current_user
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    begin
      @decoded = decode(header)
      @current_user ||= User.find_by(id: @decoded[:user_id])
    rescue JWT::DecodeError => e
      render json: { status: 401, message: "You need to sign in or sign up before continuing." }
    end
  end

  def authenticate!
    current_user
  end

  private

  def encode(payload, exp = 24.hours.from_now)
    #payload[:exp] = exp.to_i #Uncomment this to expire user's session
    JWT.encode(payload, SECRET_KEY)
  end

  def decode(token)
    decoded = JWT.decode(token, SECRET_KEY)[0]
    HashWithIndifferentAccess.new decoded
  end

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :phone_number, :is_verified, :verify_otp)}
  end
end
