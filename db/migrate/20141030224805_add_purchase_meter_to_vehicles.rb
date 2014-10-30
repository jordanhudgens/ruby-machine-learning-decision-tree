class AddPurchaseMeterToVehicles < ActiveRecord::Migration
  def change
    add_column :vehicles, :purchase_meter, :decimal
  end
end
