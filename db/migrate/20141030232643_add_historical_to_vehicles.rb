class AddHistoricalToVehicles < ActiveRecord::Migration
  def change
    add_column :vehicles, :historical, :boolean
  end
end
