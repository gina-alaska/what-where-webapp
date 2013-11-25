class CreateMaps < ActiveRecord::Migration
  def change
    create_table :maps do |t|
      t.string :name
      t.text   :question
      t.text   :answer
      t.text   :bounds
      t.timestamps
    end
  end
end
