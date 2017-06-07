class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.integer :match_id
      t.string :result
      t.integer :team_score
      t.integer :away_score

      t.timestamps
    end
  end
end
