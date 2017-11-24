class Game < ApplicationRecord
  has_many :gamables
  has_many :users, through: :gamables
end
