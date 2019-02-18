class CreateUnityBasicHealths < ActiveRecord::Migration
  def change
    create_table :unity_basic_healths do |t|
      t.string :name
      t.string :neighborhood
      t.string :address
      t.string :city
      t.string :phone

      t.timestamps null: false
    end
  end
end
