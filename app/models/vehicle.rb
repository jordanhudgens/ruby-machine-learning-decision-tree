class Vehicle < ActiveRecord::Base
  def self.decision_tree
    @decision_tree ||= calculate_decision_tree
  end

  def prediction
    @prediction ||= calculate_prediction
  end

  def good_prediction?
    prediction == status
  end

  # CSV Importer class method
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Vehicle.create! row.to_hash
    end
  end

  # CSV Downloader class method
  def self.to_csv(vehicles)
    CSV.generate do |csv|
      csv << column_names
      vehicles.each do |vehicle|
        csv << vehicle.attributes.values_at(*column_names)
      end
    end
  end

  private

  def calculate_prediction
    data =  [self[:year], self[:make], self[:mileage], self[:fuel], self[:repairs], self[:services], self[:status]]
    self.class.decision_tree.predict(data)
  end

  def self.calculate_decision_tree
    historical_data_set = Vehicle.where(historical: true)

    # Convert the query results to
    converted_historical = historical_data_set.map { |h| [h[:year], h[:make], h[:mileage], h[:fuel], h[:repairs], h[:services], h[:status]]}

    # Instantiate the tree, and train it based on the data (set default to '1')
    attributes = ['year', 'make', 'mileage', 'fuel', 'repairs', 'services']
    dec_tree = DecisionTree::ID3Tree.new(attributes, converted_historical, 'Retired', year: :discrete, make: :discrete, mileage: :continuous, fuel: :discrete, repairs: :continuous, services: :continuous)
    dec_tree.train
    dec_tree
  end
end
