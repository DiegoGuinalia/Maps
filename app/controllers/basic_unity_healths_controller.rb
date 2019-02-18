class BasicUnityHealthsController < ApplicationController
  has_scope :by_query

  def index
    if params["by_query"].present?
      @ubs = apply_scopes(UnityBasicHealth)
        .all.map{
          |m| [m.name.to_s, m.geocode.lat, m.geocode.long] 
        }

      @fix_marker =  @ubs.last.drop(1)
    else
      @ubs = []
      @fix_marker = []
    end
  end
end