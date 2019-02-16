class CreateGeocodes < ActiveRecord::Migration
  def change
    create_table :geocodes do |t|
      t.float :lat
      t.float :long
      t.integer :unity_basic_health_id

      t.timestamps null: false
    end
  end
end
