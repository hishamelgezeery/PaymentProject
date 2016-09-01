class Client < ApplicationRecord
  belongs_to :location
  has_many :payments
end
