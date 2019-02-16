  require 'csv'
  
  puts "Lendo arquivo .Csv"
  csv_text = File.read(Rails.root.join("public", "ubs.csv"))
  csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
  csv.each do |row|
    ubs = UnityBasicHealth.new
    geocode = Geocode.new
    score = Score.new
    
    ubs.address = "#{row['dsc_endereco']}, #{row["dsc_bairro"]}"
    ubs.address = "#{row['dsc_endereco']}, #{row["dsc_bairro"]}"
    ubs.address = "#{row['dsc_endereco']}, #{row["dsc_bairro"]}"
    ubs.city = row["dsc_cidade"]
    ubs.phone = row['dsc_telefone']
    ubs.save
    puts "Criado ubs id:#{ubs.id}"
    
    geocode.lat = row['vlr_latitude']
    geocode.long = row['vlr_longitude']
    geocode.unity_basic_health = ubs
    geocode.save
    
    score.adaptation_for_seniors = Score.score_ranking(row['dsc_adap_defic_fisic_idosos'])
    score.medical_equipment = Score.score_ranking(row['dsc_equipamentos'])
    score.medice = Score.score_ranking(row['dsc_medicamentos'])
    score.unity_basic_health = ubs
    score.save
  end
  
  puts "Até agora foram cadastrados #{ubs.count} ubs no banco de dados!"
  

