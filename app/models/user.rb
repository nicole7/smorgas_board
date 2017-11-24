class User < ApplicationRecord
  has_secure_password

  has_many :requests, dependent: :destroy
  has_many :pending_friends, through: :requests, source: :friend


  has_many :friendings, dependent: :destroy 
  has_many :friends, through: :friendings
  
  has_many :gamables
  has_many :games, through: "gamables"

  validates :username, uniqueness: true
  validates :username, presence: true

end
