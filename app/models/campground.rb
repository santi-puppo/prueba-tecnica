class Campground < ApplicationRecord
  has_many :campsites

  def price_range; end

  def booked_dates
    res = []
    campsites.map { booked_dates }.each { |dates| res += dates }
    res
  end
end
