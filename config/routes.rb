Rails.application.routes.draw do
  root :to => "basic_unity_healths#index"
  
  resources :basic_unity_healths do
    member do
     get :show  
    end
    
    collection do
      get :index
      #get '/issues/list_page' => 'issues#list_page', :as => :list_page
    end
  end
  
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :basic_unity_healths, only: [:find_ubs], :path => "" do
        collection do
          get :find_ubs, :path => "find_ubs"
        end
      end
    end
  end
end
