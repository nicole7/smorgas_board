class User < ApplicationRecord


  # has_many :games
  # has_many :friendings
  # has_many :friends, through: :friendings, foreign_key: :acceptor_id
  has_and_belongs_to_many :friendings, class_name: "User", connection: "friendings", foreign_key: "requester_id", association_foreign_key: "acceptor_id"
  has_many :gamables
  has_many :games, through: "gamables"

end
