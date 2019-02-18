class UnityBasicHealth < ActiveRecord::Base
  has_one :score
  has_one :geocode
  
  scope :by_geocode, -> (lat, long){ 
    Geocode
    .where("lat LIKE ? AND long LIKE ?", "%#{lat}%", "%#{long}%")
    .map(&:unity_basic_health)
  }
  
  scope :by_query, -> (query){ 
    where(
      "name LIKE ? 
      OR city LIKE ? 
      OR address LIKE ?
      OR neighborhood LIKE ?",
      "%#{query}%",
      "%#{query}%",
      "%#{query}%",
      "%#{query}%"
    )
  }

end
