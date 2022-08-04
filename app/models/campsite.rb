class Campsite < ApplicationRecord
  belongs_to :campground
  validates :name, :price, :campground, presence: true

  # Disponible si no hay ninguna fehca reservada en el rango
  def available?(from, to)
    booked_dates.find { |date| date.between?(from, to) }.blank?
  end

  def book(from, to)
    raise RangeError, "No esta libre de #{from} a #{to}" unless available?(from, to)

    self.booked_dates += (from..to).to_a
    self.booked_dates.sort
    save
  end
end
