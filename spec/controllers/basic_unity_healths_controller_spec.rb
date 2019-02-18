require 'rails_helper'

describe BasicUnityHealthsController do
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
  
  context "GET index" do
    context "GET default" do

      it "should return default" do
        get :index
          expect(response.code).to eq("200")
          expect(assigns(:ubs)).to eq([])
      end 
    end
    
    context "GET query result" do
    
      before do
        ubs.reload
        geocode.reload
        score.reload
      end
      
      it "hould return query result" do
        get :index,
        :by_query => "#{ubs.name}"
        expect(response.code).to eq("200")
        expect(assigns(:ubs)).not_to eq([])
        expect(assigns(:ubs)[0]).to include("#{ubs.name}")
      end
    end
  end
end