require 'test_helper'

class VehiclesControllerTest < ActionController::TestCase
  setup do
    @vehicle = vehicles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vehicles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vehicle" do
    assert_difference('Vehicle.count') do
      post :create, vehicle: { category: @vehicle.category, color: @vehicle.color, custom: @vehicle.custom, equipment: @vehicle.equipment, fuel: @vehicle.fuel, make: @vehicle.make, mileage: @vehicle.mileage, model: @vehicle.model, plate: @vehicle.plate, purchase_code: @vehicle.purchase_code, purchase_price: @vehicle.purchase_price, repairs: @vehicle.repairs, services: @vehicle.services, start_cost: @vehicle.start_cost, status: @vehicle.status, transmission: @vehicle.transmission, unit: @vehicle.unit, vin: @vehicle.vin, virtual_meter: @vehicle.virtual_meter, weight: @vehicle.weight, year: @vehicle.year }
    end

    assert_redirected_to vehicle_path(assigns(:vehicle))
  end

  test "should show vehicle" do
    get :show, id: @vehicle
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vehicle
    assert_response :success
  end

  test "should update vehicle" do
    patch :update, id: @vehicle, vehicle: { category: @vehicle.category, color: @vehicle.color, custom: @vehicle.custom, equipment: @vehicle.equipment, fuel: @vehicle.fuel, make: @vehicle.make, mileage: @vehicle.mileage, model: @vehicle.model, plate: @vehicle.plate, purchase_code: @vehicle.purchase_code, purchase_price: @vehicle.purchase_price, repairs: @vehicle.repairs, services: @vehicle.services, start_cost: @vehicle.start_cost, status: @vehicle.status, transmission: @vehicle.transmission, unit: @vehicle.unit, vin: @vehicle.vin, virtual_meter: @vehicle.virtual_meter, weight: @vehicle.weight, year: @vehicle.year }
    assert_redirected_to vehicle_path(assigns(:vehicle))
  end

  test "should destroy vehicle" do
    assert_difference('Vehicle.count', -1) do
      delete :destroy, id: @vehicle
    end

    assert_redirected_to vehicles_path
  end
end
