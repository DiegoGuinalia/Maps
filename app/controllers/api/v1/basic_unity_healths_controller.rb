class Api::V1::BasicUnityHealthsController < Api::V1::BaseController
  require 'will_paginate/array'
  
  def find_ubs
    if params[:query].nil?
      render status: 500, json: {message: "Request out of params"}
    else
      query_params = params[:query].split(",")
      lat = query_params[0].to_i
      long = query_params[1].to_i
      
      ubs = UnityBasicHealth.by_geocode(lat, long)
      
      @ubs_entries = ubs.count 
      @ubs = ubs.sort_by { |u| u[:city] }
        .paginate(:page => params[:page], :per_page => 10)
    end
  end
end