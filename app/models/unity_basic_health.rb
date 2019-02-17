class UnityBasicHealth < ActiveRecord::Base
  has_one :score
  has_one :geocode
  
  scope :by_geocode, -> (lat, long){ 
    Geocode
    .where("lat LIKE ? AND long LIKE ?", "%#{lat}%", "%#{long}%")
    .map(&:unity_basic_health)
  }
end
