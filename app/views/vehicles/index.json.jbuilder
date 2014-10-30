json.array!(@vehicles) do |vehicle|
  json.extract! vehicle, :id, :unit, :year, :make, :model, :plate, :mileage, :vin, :category, :color, :status, :equipment, :fuel, :weight, :transmission, :custom, :purchase_code, :purchase_price, :start_cost, :virtual_meter, :repairs, :services
  json.url vehicle_url(vehicle, format: :json)
end
