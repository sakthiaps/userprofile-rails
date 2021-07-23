class CreateManufacturingEntry < ActiveRecord::Migration[6.0]
  def change
    create_table :manufacturing_entries do |t|
      t.string :user_name
      t.string :shift
      t.integer :production_count
      t.integer :defect_count
      t.datetime :start_date

      t.timestamps
    end
  end
end
