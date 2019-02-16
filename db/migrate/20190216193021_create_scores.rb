class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :adaptation_for_seniors
      t.integer :medical_equipment
      t.integer :medice
      t.integer :unity_basic_health_id

      t.timestamps null: false
    end
  end
end
