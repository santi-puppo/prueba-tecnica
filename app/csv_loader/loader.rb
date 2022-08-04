require 'csv'

module CsvLoader
  class Loader
    def self.load(path)
      csv_text = File.read(path)
      data = CSV.parse(csv_text, headers: true)
      data.each do |row|
        create_campsite(row.to_hash)
      end
    end

    def self.create_campsite(data)
      private_class_method
      puts data
      campground = Campground.find_or_create_by name: (data['campground_name'])
      campsite = Campsite.new name: data['campsite_name'], price: data['price_usd'], campground: campground

      if campsite.save
        puts "Se crea #{campsite.name}"
      else
        puts "Error al crear #{campsite.name}"
      end
    end
  end
end
