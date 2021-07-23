class V1::ManufacturingsController < ApplicationController

  # before_action :authenticate_user!

  def create
    products = ManufacturingEntry.new(permitted_params)

    if products.save
      render json: {status: 200, message: "Saved Successfully"}, status: 200

    else
      render json: {status: 'error', message: "Sorry something went wrong"}, status: 422
    end
  end


  private

  def permitted_params
    params.require(:entry).permit(:shift, :production_count, :defect_count, :user_name, :start_date)
  end

end
