class UnityBasicHealth < ActiveRecord::Base
    has_one :score
    has_one :geocode
end
