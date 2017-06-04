class CreateMatches < ActiveRecord::Migration[5.0]
  def change
    create_table :matches do |t|
      t.integer :team_id
      t.integer :away_id

      t.timestamps
    end
  end
end
