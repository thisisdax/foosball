class User < ApplicationRecord
  has_one :team, through: :members
end
