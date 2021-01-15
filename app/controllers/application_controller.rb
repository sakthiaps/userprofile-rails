require 'auth_token'
class ApplicationController < ActionController::API

  def index
    render json: {status: 'ok', version: '1.0'}, status: 200
  end

  private

  def authenticate_user!
    validate_token

    if @token_value.blank? || AuthToken.expired?(@token_value)
      invalid_token
      return
    end

    current_api_user

    if @current_user.blank?
      invalid_user
      return
    end
  end

  def jwt_token
    logger.debug "Header Value: #{request.headers['token']}"

    request.headers['token'] if request.headers['token'].present? && AuthToken.valid?(request.headers['token'])
  end

  def validate_token
    @token_value = AuthToken.decoded_token_value(jwt_token)
  end

  def current_api_user
    return @current_user if @current_user.present?

    if @token_value.present?
      @current_user = User.find_by_id(@token_value["user_id"])
    end
  end


  def invalid_user
    render json: { status: 401, message: "You are not authorized to access." }, status: 401 and return
  end

  def invalid_token
    render json: { status: 401, message: "Session expired." }, status: 401 and return
  end

end
