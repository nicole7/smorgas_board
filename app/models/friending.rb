class Friending < ApplicationRecord
  belongs_to :requester
  belongs_to :acceptor, class_name: "User"
end
