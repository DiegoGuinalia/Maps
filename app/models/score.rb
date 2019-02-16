class Score < ActiveRecord::Base
  belongs_to :unity_basic_health
  
  def self.score_ranking(row)
    case row
      when "Desempenho muito acima da média"
        3
      when "Desempenho acima da média"
        2
      when "Desempenho mediano ou  um pouco abaixo da média"
        1
    end
  end
end
