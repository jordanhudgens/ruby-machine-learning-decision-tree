class VehiclesController < ApplicationController
  before_action :set_vehicle, only: [:show, :edit, :update, :destroy]

  # GET /vehicles
  # GET /vehicles.json
  def index
    # Make the queries from the database
    @displayed_vehicles = Vehicle.all


    # attributes = ['Temperature']
    # training = [
    #     [36.6, 'healthy'],
    #     [37, 'sick'],
    #     [38, 'sick'],
    #     [36.7, 'healthy'],
    #     [40, 'sick'],
    #     [50, 'really sick'],
    # ]
    #
    # dec_tree = DecisionTree::ID3Tree.new(attributes, training, 'sick', :continuous)
    # dec_tree.train
    #
    # test = [37, 'sick']
    # decision = dec_tree.predict(test)
    # p training
    # puts "Predicted: #{decision} ... True decision: #{test.last}"



    respond_to do |format|
      format.html
      format.csv { render text: Vehicle.to_csv(@displayed_vehicles.reject(&:good_prediction?)) }
    end
  end

  # GET /vehicles/1
  # GET /vehicles/1.json
  def show
  end

  # GET /vehicles/new
  def new
    @vehicle = Vehicle.new
  end

  # GET /vehicles/1/edit
  def edit
  end

  # POST /vehicles
  # POST /vehicles.json
  def create
    @vehicle = Vehicle.new(vehicle_params)

    respond_to do |format|
      if @vehicle.save
        format.html { redirect_to @vehicle, notice: 'Vehicle was successfully created.' }
        format.json { render :show, status: :created, location: @vehicle }
      else
        format.html { render :new }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vehicles/1
  # PATCH/PUT /vehicles/1.json
  def update
    respond_to do |format|
      if @vehicle.update(vehicle_params)
        format.html { redirect_to @vehicle, notice: 'Vehicle was successfully updated.' }
        format.json { render :show, status: :ok, location: @vehicle }
      else
        format.html { render :edit }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vehicles/1
  # DELETE /vehicles/1.json
  def destroy
    @vehicle.destroy
    respond_to do |format|
      format.html { redirect_to vehicles_url, notice: 'Vehicle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # Importer
  def import
    Vehicle.import(params[:file])
    redirect_to vehicles_path, notice: "Companies Added Successfully"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle
      @vehicle = Vehicle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vehicle_params
      params.require(:vehicle).permit(:unit, :year, :make, :model, :plate, :mileage, :vin, :category, :color, :status, :equipment, :fuel, :weight, :transmission, :custom, :purchase_code, :purchase_price, :start_cost, :virtual_meter, :repairs, :services)
    end
end
