class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :unit
      t.integer :year
      t.string :make
      t.string :model
      t.string :plate
      t.integer :mileage
      t.string :vin
      t.string :category
      t.string :color
      t.string :status
      t.string :equipment
      t.string :fuel
      t.integer :weight
      t.string :transmission
      t.string :custom
      t.integer :purchase_code
      t.decimal :purchase_price
      t.decimal :start_cost
      t.integer :virtual_meter
      t.integer :repairs
      t.integer :services

      t.timestamps
    end
  end
end
