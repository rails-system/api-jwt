class Api::V1::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :authenticate_request!, only: [:destroy]
  skip_before_action :verify_signed_out_user, if:-> { request.format.json? }
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    login = params[:user][:email].downcase || params[:user][:phone_nunber]
    user = User.where(["phone_number = :value OR email = :value", {value: login}]).first  
    if user.present? && user.valid_password?(params[:user][:password])
      token = JsonWebToken.encode(user_id: user.id)
      Profile.find_or_create_by(user_id: user.id)
      render json: {
        success: true,
        auth_token: token,
      }, status: :created and return
    else
      render json: {
        success: false,
        error: 'Invalid Credentials'
      }, status: :unauthorized and return
    end
  end

  # DELETE /resource/sign_out
  def destroy
    if current_user
      sign_out current_user
      render json: {success: true, message: 'User Logout successfull'}, status: 200
    else
      render json: {success: false, :message => 'Invalid Token'}, :status => 404
    end
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
