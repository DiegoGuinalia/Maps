class Api::V1::BasicUnityHealthsController < Api::V1::BaseController
  
  def find_ubs
    query_params = params[:query].split(",")
    lat = query_params[0]
    long = query_params[1]
    @ubs = UnityBasicHealth
      .by_geocode(lat, long)
      .order('created_at DESC')
      .page(params[:page])
      .per_page(10)
  end
end