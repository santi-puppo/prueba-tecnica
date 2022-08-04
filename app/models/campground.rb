class Campground < ApplicationRecord
  has_many :campsites

  def price_range
    minmax = campsites.map(&:price).minmax
    if minmax.blank?
      min = 0, max = 0
    else
      min = minmax.first
      max = minmax.last
    end
    min..max
  end

  def booked_dates
    res = []
    campsites.map(&:booked_dates).each { |dates| res.union dates }
    res.sort
  end

  # Si tiene algun campsite libre en las fechas lo considero libre.
  # Filtro los que encuentro una fecha en el medio del rango -> No esta libre
  # Si se quisiera considerar los booked_dates como se define arriba, habria que fijarse que todos los campsites esten
  #   libres
  def self.availables(from, to)
    Campground.all.filter do |campground|
      campground.available?(from, to)
    end
  end

  def available?(from, to)
    !campsites.find { |campsite| campsite.available?(from, to) }.blank?
  end

  def self.price_desc
    Campground.all.sort_by { |campground| - campground.price_range.first }
  end

  def self.price_asc
    Campground.all.sort_by { |campground| campground.price_range.first }
  end
end
