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

  def index
    products = ManufacturingEntry.all.order(id: :desc)
    data = {}

    columns = [
      {
        label: 'Name',
        field: 'user_name',
        sort: 'asc',
        width: 150
      },

      {
        label: 'Date',
        field: 'production_date',
        sort: 'desc',
        width: 150
      },

      {
        label: 'Shift',
        field: 'shift',
        sort: 'asc',
        width: 150
      },

      {
        label: 'Production',
        field: 'production_count',
        sort: 'asc',
        width: 150
      },

      {
        label: 'Defect Count',
        field: 'defect_count',
        sort: 'asc',
        width: 150
      },
    ]

    data[:columns] = columns
    data[:rows] = products.as_json

    render json: {data: data, status: 200}

  end


  private

  def permitted_params
    params.require(:entry).permit(:shift, :production_count, :defect_count, :user_name, :start_date)
  end

end
