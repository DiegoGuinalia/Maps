class UnityBasicHealth < ActiveRecord::Base
  has_one :score
  has_one :geocode
  
  scope :by_geocode, -> (lat, long){ 
    UnityBasicHealth.joins(:geocode).merge(Geocode.where(lat:lat, long: long))
  }
end
