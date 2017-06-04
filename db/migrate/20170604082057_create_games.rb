class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.integer :match_id
      t.string :result
      
      t.timestamps
    end
  end
end
