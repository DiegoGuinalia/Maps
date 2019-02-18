require 'rails_helper'
require 'json'

describe Api::V1::BasicUnityHealthsController do
  context "GET find_ubs" do
    context "GET error " do
      before do
        UnityBasicHealth.create
      end
      
      it "should return erro 500" do
        get :find_ubs
        expect(response.code).to eq("500")
        expect(response.message).to eq("Internal Server Error")
        expect(response.body).to include("Request out of params")
      end 
    end
    
    context "Get success json" do
      let(:ubs) { UnityBasicHealth.create(
          name: "UNIDADE DE SAUDE DE SAO MATEUS",
          neighborhood: "",
          address: "SAO MATEUS",
          city: "Anchieta", 
          phone: "2898842751"
        )
      }  
      let(:geocode) { Geocode.create(
          lat: -20.7629585266107,
          long: -40.7275199890125,
          unity_basic_health: ubs
        )
      }
      let(:score) { Score.create(
        adaptation_for_seniors: 1,
        medical_equipment: 1,
        medice: 2,
        unity_basic_health: ubs)
      }
      
      before do
        ubs.reload
        geocode.reload
        score.reload
      end
      
      it "Should return success" do
        get :find_ubs,
        :query => "#{ubs.reload.geocode.lat},#{ubs.reload.geocode.long}",
        format: :json
        
        expect(response.response_code).to eq(200)
        expect(response.content_type).to eq("application/json")
      end
    end
  end
  
end