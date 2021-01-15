class V1::UsersController < ApplicationController

  before_action :authenticate_user!, except: [:login, :signup]

  def login
    user = User.find_by(email: permitted_params[:email])
    if user&.status? && user.authenticate(permitted_params[:password])
      render json: { data: user.as_json, token: user.generate_token, status: 200 }, status: 200
    else
      render json: { status: 401, error: "Invalid credentials" }, status: 401
    end
  end

  def signup
    user = User.find_by(email: permitted_params[:email])

    if user.blank?
      user = User.new(permitted_params)

      if user.valid? && user.save
        render json: { message: "Account created successfully", status: 200 }, status: 200
      else
        render json: { status: 401, error: user.errors.full_messages}
      end

    else
      render json: { status: 422, error: "Hey, You already have account with us. Please sign in"}
    end
  end

  def profile
    render json: {status: 200, data: @current_user.as_json(only: [:first_name, :last_name, :mobile_number]) }, status: 200
  end

  def update_profile
    if @current_user.valid? && @current_user.update(permitted_params)
      render json: {status: 200, message: "Profile updated successfully", data: @current_user.as_json(only: [:first_name, :last_name, :mobile_number])}, status: 200
    else
      render json: { status: 422, error: @current_user.errors.full_messages}
    end
  end

  private

  def permitted_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :mobile_number)
  end

end
