class ManufacturingEntry < ApplicationRecord

  def as_json(options = {})
    super(only: [:user_name, :start_date, :production_count, :defect_count, :shift],
      methods: [:production_date]
    )
  end

  def production_date
    start_date ? start_date.strftime("%d-%m-%Y") : ""
  end
end
