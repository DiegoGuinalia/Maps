json.array! @ubs do |ubs|

  json.body do 
    json.query          params[:query]
    json.current_page   params[:page].to_i
    json.per_page       params[:per_page].to_i
    json.total_entries  @ubs_entries
    
    json.entries do
      json.id       ubs.id
      json.name     ubs.name
      json.address  ubs.address
      json.city     ubs.city
      json.phone    ubs.phone
      
      json.geocode do
        json.lat  ubs.geocode.lat
        json.long ubs.geocode.long
      end
      
      json.score do
        json.adaptation_for_seniors ubs.score.adaptation_for_seniors
        json.medical_equipment      ubs.score.medical_equipment
        json.medice                 ubs.score.medice
      end
    end
  end
end