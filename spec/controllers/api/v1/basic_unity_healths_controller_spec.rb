require 'rails_helper'

describe Api::V1::BasicUnityHealthsController do
  describe "GET find_ubs" do
    it "should return erro 500" do
      team = UnityBasicHealth.create
      get :find_ubs
      expect(response.code).to eq("500")
      expect(response.message).to eq("Internal Server Error")
      expect(response.body).to include("Request out of params")
    end 
  end
end