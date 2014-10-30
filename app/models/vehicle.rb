class Vehicle < ActiveRecord::Base
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Vehicle.create! row.to_hash
    end
  end

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |vehicle|
        csv << vehicle.attributes.values_at(*column_names)
      end
    end
  end
end
