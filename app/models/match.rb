class Match < ApplicationRecord
  has_one :game
  belongs_to :team
  belongs_to :away , :class_name => 'Team', :foreign_key => 'away_id'
end
